require "rubygems"
require "grape"
require "./application"

class API < Grape::API
  prefix 'api'
  format :json

  resource :user do 
    get ':id' do
      User.get(params[:id])
    end
  end
end

run Rack::Cascade.new [API, Application]