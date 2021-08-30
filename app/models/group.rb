class Group < ApplicationRecord
  has_many :users_groups, dependent: :destroy, inverse_of: :group
  has_many :users, through: :users_groups

  validates :name, presence: true, uniqueness: true
end
