class User < ApplicationRecord
  has_secure_password

  validates :login, presence: true
  validates :login, uniqueness: true
end
