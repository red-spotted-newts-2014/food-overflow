require 'faker'

FactoryGirl.define do
  factory :question do |q|
    q.title { Faker::Lorem.word }
    q.content { Faker::Lorem.sentence }
  end

  factory :hashtag do 
  		title { Faker::Lorem.word }
  end
end
