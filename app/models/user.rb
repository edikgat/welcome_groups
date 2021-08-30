class User < ApplicationRecord
  has_many :users_groups, dependent: :destroy, inverse_of: :user
  has_many :groups, through: :users_groups

  has_secure_password

  validates :login, presence: true
  validates :login, uniqueness: true
end
