FactoryGirl.define do
  factory :group do
    name    Faker::Name.name
    initialize_with { Group.find_or_create_by(name: name)}
  end
end
