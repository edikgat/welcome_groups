# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::GroupRepresenter do
  subject(:represented) { described_class.new(group).as_json }

  let(:group)   { create(:group, name: 'TestGroup', id: 240)                    }
  let(:message) { create(:message, user: user, content: 'Hello!', group: group) }
  let(:user)    { create(:user, id: 100, login: 'test_user')                    }

  before do
    Timecop.freeze(Time.utc(2020, 10, 1, 1, 0, 0))
    message
  end

  it 'serialize message' do
    expect(represented).to eq(
      {
        'id' => 240,
        'name' => 'TestGroup',
        'messages' =>
  [
    {
      'id' => 7,
      'content' => 'Hello!',
      'user' => { 'id' => 100, 'login' => 'test_user' },
      'created_at_text' => '01:00:00 01 October 2020'
    }
  ]
      }
    )
  end
end
