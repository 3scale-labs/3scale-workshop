require 'rest_client'

class Helper < Sinatra::Base
  get '/success' do
    RestClient.post "http://apistrat-account-creation.herokuapp.com/create", { :email => ENV['THREESCALE_ADMIN_EMAIL'], :org_name => ENV['ORG_NAME'], :subdomain => ENV['SUBDOMAIN'] || ENV['ORG_NAME'] }
  end
end