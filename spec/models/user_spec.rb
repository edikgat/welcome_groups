# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  subject(:user) { create(:user) }

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:login).case_insensitive }
  it { is_expected.to validate_presence_of(:login) }
  it { is_expected.to validate_presence_of(:password) }
end
