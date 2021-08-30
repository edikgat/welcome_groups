require 'rails_helper'

describe UsersGroup, type: :model do
  subject(:users_group) { create(:users_group) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:group) }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:group_id) }
end
