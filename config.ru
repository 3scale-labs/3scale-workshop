require "rubygems"
require "grape"
require "./application"

class API < Grape::API
  get '/' do 
    "test".to_json
  end
end

run Rack::Cascade.new [API, Sinatra::Application]