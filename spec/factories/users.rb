FactoryBot.define do
  factory :user do
    sequence(:login)      { |n| "login_#{n}" }
    password              { "Admin123" }
    password_confirmation { "Admin123" }
  end
end
