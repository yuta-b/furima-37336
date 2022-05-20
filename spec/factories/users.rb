FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    first_name            {'test'}
    first_name_kana       {'test'}
    last_name             {'test'}  
    last_name_kana        {'test'}
    birth_day             {'test'} 
    encrypted_password    {'000000'}
    password_confirmation {password}
  end
end