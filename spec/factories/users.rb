FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "login_#{n}" }
  end
end
