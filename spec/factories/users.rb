FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name { Faker::FamilyGuy.character }
    email
  end
end