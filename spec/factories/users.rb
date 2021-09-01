FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password { "Password123" }
    password_confirmation { "Password123" }
  end
end
