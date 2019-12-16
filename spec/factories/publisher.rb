FactoryBot.define do
  factory :publisher do
    name { Faker::Games::Pokemon.name }
    tel { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }

    note { Faker::Lorem.paragraph }
    online { [true,false].sample }
  end
end