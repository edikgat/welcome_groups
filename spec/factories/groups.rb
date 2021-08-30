FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "name_#{n}" }
  end
end
