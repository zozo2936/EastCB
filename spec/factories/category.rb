FactoryBot.define do
  factory :category do
    title { Faker::Games::Pokemon.name }
  end
end