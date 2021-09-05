# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    user { build(:user) }
    group { build(:group) }
    content { Faker::Lorem.sentence }
  end
end
