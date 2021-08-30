FactoryBot.define do
  factory :message do
    user { build(:user) }
    group { build(:group) }
    content { 'MyText' }
  end
end
