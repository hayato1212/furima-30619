FactoryBot.define do
  factory :item_buy do
    postal_code   { "111-1111" }
    prefecture_id { 2 }
    municipality  { Faker::Lorem.sentence}
    house_number  { Faker::Lorem.sentence}
    phone_number  { Faker::Number.number(digits: 11)}
    token         { Faker::Lorem.sentence}
  end
end
