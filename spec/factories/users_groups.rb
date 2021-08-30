FactoryBot.define do
  factory :users_group do
    user { build(:user) }
    group { build(:group) }
  end
end
