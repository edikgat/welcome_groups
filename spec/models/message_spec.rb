require 'rails_helper'

describe Message, type: :model do
  subject(:message) { create(:message) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:group) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
end
