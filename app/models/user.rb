# frozen_string_literal: true

class User < ApplicationRecord
  has_many :groups, foreign_key: :owner_id, dependent: :destroy, inverse_of: :owner
  has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable, :validatable

  validates :login, presence: true, uniqueness: { case_sensitive: false }
end
