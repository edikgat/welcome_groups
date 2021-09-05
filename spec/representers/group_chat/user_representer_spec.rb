# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::UserRepresenter do
  subject(:represented) { described_class.new(user).as_json }

  let(:user) { create(:user, id: 100, login: 'test_user') }

  it 'serialize user' do
    expect(represented).to eq({ 'id' => 100, 'login' => 'test_user' })
  end
end
