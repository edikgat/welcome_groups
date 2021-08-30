require 'rails_helper'

describe User, type: :model do
  subject(:user) { create(:user) }

  it { is_expected.to validate_uniqueness_of(:login) }
  it { is_expected.to validate_presence_of(:login) }
  it { is_expected.to have_secure_password }
end
