FactoryBot.define do
  factory :order do
    postal_code { '333-3333' }
    prefecture_id { 4 }
    city { '札幌市' }
    house_number { '蟹111' }
    phone_number { '01234567890' }
    building_name { 'さかな' }
    item_id { 1 }
    user_id { 1 }
    token { 'tk_g39248579347' }
  end
end
