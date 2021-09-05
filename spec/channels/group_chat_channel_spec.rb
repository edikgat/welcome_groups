# frozen_string_literal: true

require 'rails_helper'

describe GroupChatChannel, type: :channel do
  before do
    stub_connection current_user: user
  end

  let(:user)  { create(:user)          }
  let(:group) { create(:group, id: 42) }

  describe '#subscribed' do
    context 'when no group id parameter' do
      it 'rejects subscription' do
        subscribe
        expect(subscription).to be_rejected
      end
    end

    context 'when group does not exists' do
      it 'rejects subscription' do
        subscribe(group_id: 100_500)
        expect(subscription).to be_rejected
      end
    end

    context 'when group exists' do
      before { group }

      it 'subscribes to a stream' do
        subscribe(group_id: group.id)

        expect(subscription).to be_confirmed
        expect(subscription).to have_stream_from("group_chat_#{group.id}_channel")
      end
    end
  end

  describe '#create_message' do
    before { subscribe(group_id: group.id) }

    let(:create_message_request) { subscription.create_message(request_content) }
    let(:request_content) { { content: '123' } }

    context 'when no body' do
      let(:request_content) { { content: '' } }

      it 'transmit error info' do
        create_message_request
        expect(transmissions.last).to eq({ 'type' => 'error', 'data' => ["Content can't be blank"] })
      end

      it 'not enque job' do
        expect { create_message_request }
          .not_to have_enqueued_job(GroupChat::NewMessageBroadcastJob)
      end
    end

    context 'when content exists' do
      let(:request_content) { { 'content' => '123' } }

      it 'enqueue job' do
        expect { create_message_request }
          .to(
            have_enqueued_job(GroupChat::NewMessageBroadcastJob).on_queue('group_chat')
          )
      end
    end
  end
end
