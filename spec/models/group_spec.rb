require 'rails_helper'

describe Group, type: :model do
  subject(:group) { create(:group) }

  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:owner) }
end
