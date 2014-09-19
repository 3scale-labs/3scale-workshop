require "rubygems"
require "grape"
require "./application"
require "./tools/helper"

class API < Grape::API
  prefix 'api'
  format :json

  resource :user do 
    get ':id' do
      User.get(params[:id])
    end
  end

  resource :meals do
    desc "Get all meals"
    get do
      Category.all(:type => :food).to_json
    end
  end

  resource :activities do
    desc "Get all activities"
    get do
      Category.all(:type => :activity).to_json
    end
  end

  resource :food do
    desc "Get all foods within the given category"
    get ':id' do
      category = Category.get(:id)
      if(category.type == 'food') then
        Item.all(:category => category).to_json
      else
        '{ "error":"id does not belong to the food category"}'.to_json
      end
    end
  end

  resource :activity do
    desc "Get all activities within the given category"
    get ':id' do
      category = Category.get(:id)
      if(category.type == "activity") 
        Item.all(:category => category).to_json
      else
        '{ "error":"id does not belong to the activity category"}'.to_json
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