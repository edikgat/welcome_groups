# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@mail.com" }
    sequence(:login) { |_n| Faker::Internet.unique.username }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
