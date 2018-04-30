FactoryBot.define do
  factory :permission do
    type 'ActionPermission'
    slug { Faker::Beer.hop + (1..1000).to_a.sample.to_s }
  end
end
