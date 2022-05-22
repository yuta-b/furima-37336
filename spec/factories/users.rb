FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    first_name            {'かな'}
    first_name_kana       {'カタカナ'}
    last_name             {'かな'}  
    last_name_kana        {'カタカナ'}
    birth_day             {'2000-01-01'} 
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end