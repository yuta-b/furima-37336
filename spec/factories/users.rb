FactoryBot.define do
  factory :user do
    nickname                  {'test'}
    email                 {'test@example'}
    encrypted_password    {'000000'}
    password_confirmation {password}
  end
end