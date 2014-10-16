require 'rest_client'

class Helper < Sinatra::Base
  get '/success' do
    # RestClient.post "https://apistrat-account-creation.herokuapp.com/create", { :email => ENV['THREESCALE_ADMIN_EMAIL'], :org_name => ENV['ORG_NAME'], :subdomain => ENV['SUBDOMAIN'] || ENV['ORG_NAME'], :password => ENV['THREESCALE_ADMIN_PWD'] }
    RestClient::Request.execute(:url => 'https://apistrat-account-creation.herokuapp.com/create', :ssl_version => 'SSLv2', :method => 'post', :params => { :email => ENV['THREESCALE_ADMIN_EMAIL'], :org_name => ENV['ORG_NAME'], :subdomain => ENV['SUBDOMAIN'] || ENV['ORG_NAME'], :password => ENV['THREESCALE_ADMIN_PWD'] })
  end
end