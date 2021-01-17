FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@yahoo.co.jp' }
    password { '00000a' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birth_day { '1990-02-03' }
  end
end
