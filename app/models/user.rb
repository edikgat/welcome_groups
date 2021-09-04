class User < ApplicationRecord
  has_many :groups, inverse_of: :owner

  devise :database_authenticatable,
         :registerable,
         :validatable

  validates :login, presence: true, uniqueness: { case_sensitive: false }
end
