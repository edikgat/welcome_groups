class User < ApplicationRecord
  has_many :users_groups, dependent: :destroy, inverse_of: :user
  has_many :groups, through: :users_groups

  validates :login, presence: true
  validates :login, uniqueness: true
end
