FactoryBot.define do
  factory :item do
    product_name       {'sample'}
    product_version    {'test'}
    category_id        {'0'}
    condition_id       {'0'}
    delivery_charge_id {'0'}
    delivery_place_id  {'0'}
    delivery_days_id   {'0'}
    price              {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
