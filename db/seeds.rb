# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create_list(:user, 2).each do |user|
  FactoryBot.create_list(:group, 5, owner: user).each do |group|
    FactoryBot.create_list(:message, 5, user: user, group: group)
  end
end
