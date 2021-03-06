# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { Faker::Games::Pokemon.unique.name }
    owner { build(:user) }
  end
end
