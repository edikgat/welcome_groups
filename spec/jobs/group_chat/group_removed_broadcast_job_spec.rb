# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::GroupRemovedBroadcastJob do
  subject(:job) { described_class.perform_now(group_id) }

  let(:group_id)       { 123               }
  let(:broadcast_data) { { group_id: 123 } }

  describe 'perform' do
    it 'broadcasts data' do
      expect { job }
        .to have_broadcasted_to("group_chat_#{group_id}_channel")
        .with({ type: 'group_removed', data: broadcast_data })
    end
  end
end
