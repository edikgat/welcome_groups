require 'rails_helper'

describe Group, type: :model do
  subject(:group) { create(:group) }

  it { is_expected.to validate_uniqueness_of(:name) }
end
