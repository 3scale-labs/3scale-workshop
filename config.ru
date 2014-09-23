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
        user = User.get(params[:id])

        user_data = {
          :id         => user.id,
          :name       => user.username,
          :email      => user.email,
          :avatar     => user.avatar,
          :reward     => user.reward,
          :reminder   => user.reminder,
          :repeat     => user.repeat,
          :goals      => user.plans.map {|p|
            {
              :plan_id     => p.id,
              :goal_id     => p.goal.id,
              :title       => p.goal.title,
              :description => p.goal.description,
              :done        => p.done,
              :priority    => p.priority
            }
            },
            :statistics => user.statistics
          }
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

run Rack::Cascade.new [Application, API, Helper]
