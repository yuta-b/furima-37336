FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    first_name            {'馬場'}
    first_name_kana       {'ババ'}
    last_name             {'悠太'}  
    last_name_kana        {'ユウタ'}
    birth_day             {'2000-01-01'} 
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end