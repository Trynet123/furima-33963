FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 4) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birth_day { '1990-02-03' }
  end
end
