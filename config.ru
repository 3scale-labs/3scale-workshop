require "rubygems"
require "grape"
require "./application"
require "./tools/helper"

class API < Grape::API
  prefix 'api'
  format :json

  resource :user do 
    params do
      #requires :secret_token, type: String, desc: "Token sent from API Gateway"
      requires :id, type: Integer, desc: "User id."
    end
    route_param :id do
      get do
        User.get(params[:id])
      end
    end
  end

  resource :meals do
    desc "Get all meals"
    get do
      Category.all(:type => :food)
    end
  end

  resource :activities do
    desc "Get all activities"
    get do
      Category.all(:type => :activity)
    end
  end

  resource :food do
    desc "Get all foods within the given category"
    params do
      requires :id, type: Integer, desc: "Category id."
    end
    route_param :id do
      get do
        category = Category.get(params[:id])
        if(category.type == :food) then
          Item.all(:category => category)
        else
          JSON.parse('{"error": "id does not belong to the food category"}')
        end
      end
    end
  end

  resource :activity do
    desc "Get all activities within the given category"
    params do
      requires :id, type: Integer, desc: "Category id."
    end
    route_param :id do
      get do
        category = Category.get(params[:id])
        if(category.type == :activity ) 
          Item.all(:category => category)
        else
          JSON.parse('{"error": "id does not belong to the activity category"}')
        end
      end
    end
  end

end

use Rack::Block do
  # ua_pattern '/api' do
  #   halt 403, 'Forbidden'
  # end
end

run Rack::Cascade.new [API, Application, Helper]