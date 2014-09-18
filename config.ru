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

use Rack::Block do
  # ua_pattern '/api' do
  #   halt 403, 'Forbidden'
  # end
end

run Rack::Cascade.new [API, Application]