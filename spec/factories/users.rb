FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    first_name            {'test'}
    first_name_kana       {'test'}
    last_name             {'test'}  
    last_name_kana        {'test'}
    birth_day             {'2000-01-01'} 
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end