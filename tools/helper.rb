require 'patron'

class Helper < Sinatra::Base
  get '/success' do
    s = Patron::Session.new
    s.timeout = 25
    s.base_url = 'https://apistrat-account-creation.herokuapp.com:443'
    response = s.post("/create", :email => ENV['THREESCALE_ADMIN_EMAIL'], :org_name => ENV['ORG_NAME'], :subdomain => ENV['SUBDOMAIN'] || ENV['ORG_NAME'], :password => ENV['THREESCALE_ADMIN_PWD'])
    erb response.body
  end
end