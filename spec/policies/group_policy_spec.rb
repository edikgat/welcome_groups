# frozen_string_literal: true

require 'rails_helper'

describe GroupPolicy do
  subject(:policy) { described_class }

  let(:user) { build(:user) }

  permissions :new?, :create?, :index? do
    it 'grants access to groups' do
      expect(policy).to permit(user)
    end
  end

  context 'when group owner' do
    let(:group) { build(:group, owner: user) }

    permissions :update?, :edit?, :destroy? do
      it 'grants access to groups' do
        expect(policy).to permit(user, group)
      end
    end
  end

  context 'when not group owner' do
    let(:group) { build(:group) }

    permissions :update?, :edit?, :destroy? do
      it 'denies access to groups' do
        expect(policy).not_to permit(user, group)
      end
    end

    permissions :show? do
      it 'grants access to groups' do
        expect(policy).to permit(user, group)
      end
    end
  end
end
