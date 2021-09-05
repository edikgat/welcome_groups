# frozen_string_literal: true

FactoryBot.create_list(:user, 2).each do |user|
  FactoryBot.create_list(:group, 5, owner: user).each do |group|
    FactoryBot.create_list(:message, 5, user: user, group: group)
  end
end
