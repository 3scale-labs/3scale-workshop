# encoding: utf-8
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,           Serial
  property :username,     String
  property :email,        String
  property :password,     BCryptHash
  property :avatar,       String # path to avatar image
  property :reward,       Text
  property :reminder,     Date
  property :repeat,       Enum[:none, :daily, :weekly, :monthly]

  has n, :plans
  has n, :statistics

  #is :authenticatable
  def authenticate(pwd)
    if self.password == pwd
      true
    else
      false
    end
  end
end

User.fixture {{
                :username              => (user = "#{Randgen.name.downcase.tr(" ", ".")}"),
                :email                 => "#{user}@example.#{/co.uk|com|net|org/.gen}",
                :reward                => "Generic reward",
                :password              => (password = "Pa55w0rd"),
}}

get '/user/:id.json' do |id|
  content_type :json

  user = User.get(id)

  user_data = {
    :id         => user.id,
    :name       => user.name,
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

  user_data.to_json
end