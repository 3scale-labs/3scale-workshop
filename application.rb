require 'rubygems'
require 'bundler'
require 'json'
require 'date'
require 'warden'

Bundler.require

Dir[File.join(File.dirname(__FILE__), 'app/**/*.rb')].sort.each { |f| require f }

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.finalize
DataMapper.auto_upgrade!

config.i18n.enforce_available_locales = false
set :views, 'app/views'

enable :sessions
register Sinatra::Flash

use Warden::Manager do |config|
  config.serialize_into_session{|user| user.id }
  config.serialize_from_session{|id| User.get(id) }

  config.scope_defaults :default,
    strategies: [:password],
    action: 'auth/unauthenticated'
  config.failure_app = self
end

Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = 'POST'
end

Warden::Strategies.add(:password) do
  def valid?
    params['user']['username'] && params['user']['password']
  end

  def authenticate!
    user = User.first(username: params['user']['username'])

    if user.nil?
      fail!("The username you entered does not exist.")
    elsif user.authenticate(params['user']['password'])
      success!(user)
    else
      fail!("Could not log in")
    end
  end
end

get '/init' do
  unless Category.any?
    Category.import_from_yaml
    10.times { User.generate }

    user = User.first

    user.plans.create :goal => Goal.get(1)
    user.plans.create :goal => Goal.get(2)
    user.plans.create :goal => Goal.get(3)
    user.plans.create :goal => Goal.get(4)
    user.plans.create :goal => Goal.get(5)

    today = DateTime.now

    user.statistics.create :type => :weight, :date => today, :value => 153
    user.statistics.create :type => :weight, :date => today - 7, :value => 160
    user.statistics.create :type => :weight, :date => today - 14, :value => 155
    user.statistics.create :type => :weight, :date => today - 21, :value => 159
    user.statistics.create :type => :weight, :date => today - 28, :value => 165

    "Initialised"
  else
    "Previously initialised"
  end
end

get '/' do
  erb :index
end

get '/auth/login' do
  erb :login
end

post '/auth/login' do
  env['warden'].authenticate!

  flash[:success] = env['warden'].message

  if session[:return_to].nil?
    redirect '/'
  else
    redirect session[:return_to]
  end
end

get '/auth/logout' do
  env['warden'].raw_session.inspect
  env['warden'].logout
  flash[:success] = 'Successfully logged out'
  redirect '/'
end

post '/auth/unauthenticated' do
  session[:return_to] = env['warden.options'][:attempted_path]
  puts env['warden.options'][:attempted_path]
  flash[:error] = env['warden'].message || "You must log in"
  redirect '/auth/login'
end

get '/protected' do
  env['warden'].authenticate!
  @current_user = env['warden'].user
  erb :protected
end