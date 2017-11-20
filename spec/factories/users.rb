FactoryGirl.define do
  factory :user do
    name        Faker::Name.name
    email       Faker::Internet.email
    password    Faker::Lorem.characters(10)
    initialize_with { User.find_or_create_by(email: email)}
  end
end
