FactoryBot.define do
  factory :item do
    product_name       {'sample'}
    product_version    {'test'}
    category_id        {'0'}
    condition_id       {'0'}
    delivery_charge_id {'0'}
    delivery_place_id  {'0'}
    delivery_days_id   {'0'}
    price              {'300..9999999'}
    association :user
  end
end
