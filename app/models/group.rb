class Group < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
