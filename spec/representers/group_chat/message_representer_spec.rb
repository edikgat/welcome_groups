# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::MessageRepresenter do
  subject(:represented) { described_class.new(message).as_json }

  let(:message) { create(:message, user: user, content: 'Hello!', id: 350) }
  let(:user)    { create(:user, id: 100, login: 'test_user')               }

  before { Timecop.freeze(Time.utc(2020, 10, 1, 1, 0, 0)) }

  it 'serialize message' do
    expect(represented).to eq(
      {
        'id' => 350,
        'content' => 'Hello!',
        'user' => { 'id' => 100, 'login' => 'test_user' },
        'created_at_text' => '01:00:00 01 October 2020'
      }
    )
  end
end
