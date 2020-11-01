FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    category_id { 2 }
    price { Faker::Number.between(300, 9_999_999) }
    status_id { 2 }
    description { Faker::Lorem.sentence }
    prefecture_id       { 2 }
    date_of_shipment_id { 2 }
    burden_id           { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'test_image.png')
    end
  end
end
