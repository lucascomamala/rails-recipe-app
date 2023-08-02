FactoryBot.define do
  factory :user do
    name { 'User' }
    email { 'user@mail.com' }
    password_digest { '123456' }
  end
end
