FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    gender { %w(male female).sample }
  end
end
