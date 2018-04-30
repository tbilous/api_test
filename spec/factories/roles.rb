FactoryBot.define do
  factory :role do
    name { Faker::Beer.hop + (1..1000).to_a.sample.to_s }
  end
end
