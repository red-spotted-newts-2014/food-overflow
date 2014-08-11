require 'faker'

FactoryGirl.define do
  factory :user do |u|
    u.name { Faker::Name.name }
    u.email { Faker::Internet.email }
    u.password { Faker::Internet.password }
    u.image_url { "http://baconmockup.com/300/200" }
  end

  factory :question do |q|
    q.title { Faker::Lorem.word }
    q.content { Faker::Lorem.sentence }
  end

  factory :hashtag do 
  		title { Faker::Lorem.word }
  end

  factory :comment
    do |c|
      c.content { Faker::Lorem.sentence }
    end
end
