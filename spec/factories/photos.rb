FactoryGirl.define do
  factory :photo do
    description { Faker::Lorem.sentence }
    path { Faker::Avatar.image }
  end
end