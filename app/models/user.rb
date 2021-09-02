class User < ApplicationRecord
  has_many :users_groups, dependent: :destroy, inverse_of: :user
  has_many :groups, through: :users_groups

  devise :database_authenticatable,
         :registerable,
         :validatable

  validates :login, presence: true, uniqueness: { case_sensitive: false }
end
