class UsersGroup < ApplicationRecord
  belongs_to :user, inverse_of: :users_groups
  belongs_to :group, inverse_of: :users_groups

  validates :user, :group, presence: true
  validates :user_id, uniqueness: { scope: :group_id }, allow_nil: true
end
