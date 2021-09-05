# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::NewMessageBroadcastJob do
  subject(:job) { described_class.perform_now(message_id) }

  let(:message_id) { message.id                                                             }
  let(:message)    { create(:message, user: user, content: 'Hello!', id: 350, group: group) }
  let(:group)      { create(:group, id: 556)                                                }
  let(:user)       { create(:user, id: 100, login: 'test_user')                             }
  let(:broadcast_data) do
    { id: 350, content: 'Hello!', user: { id: 100, login: 'test_user' }, created_at_text: '01:00:00 01 October 2020' }
  end

  before { Timecop.freeze(Time.utc(2020, 10, 1, 1, 0, 0)) }

  describe 'perform' do
    context 'when message exists' do
      before { message }

      it 'broadcasts data' do
        expect { job }
          .to have_broadcasted_to("group_chat_#{group.id}_channel")
          .with({ type: 'new', data: broadcast_data })
      end
    end

    context 'when message does not exists' do
      let(:message_id) { 487 }

      it 'writes log' do
        allow(Rails.logger).to receive(:fatal).with("message with id: #{message_id} - not found")
        job
      end
    end
  end
end
