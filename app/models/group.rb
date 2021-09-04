class Group < ApplicationRecord
  belongs_to :owner, inverse_of: :groups, class_name: 'User'

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
