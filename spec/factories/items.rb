FactoryBot.define do
  factory :item do
    name { 'テスト' }
    text { 'テスト' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    days_to_ship_id { 2 }
    price { '300' }
    user_id { 1 }
    association :user
  end
end
