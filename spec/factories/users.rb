FactoryBot.define do
  factory :user do
    name { 'User' }
    email { 'user@mail.com' }
    password { '123456' }
  end
end
