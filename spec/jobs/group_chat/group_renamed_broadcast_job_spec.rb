# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::GroupRenamedBroadcastJob do
  subject(:job) { described_class.perform_now(group_id) }

  let(:group)          { create(:group)                           }
  let(:group_id)       { group.id                                 }
  let(:broadcast_data) { { name: group.name } }

  describe 'perform' do
    context 'when group exists' do
      it 'broadcasts data' do
        expect { job }
          .to have_broadcasted_to("group_chat_#{group_id}_channel")
          .with({ type: 'group_renamed', data: broadcast_data })
      end
    end

    context 'when group does not exists' do
      let(:group_id) { 487 }

      it 'not broadcasts data' do
        expect { job }
          .not_to have_broadcasted_to("group_chat_#{group_id}_channel")
      end

      it 'writes log' do
        allow(Rails.logger).to receive(:fatal).with("group with id: #{group_id} - not found")
        job
      end
    end
  end
end
