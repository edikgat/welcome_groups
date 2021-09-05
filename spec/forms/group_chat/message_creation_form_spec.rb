# frozen_string_literal: true

require 'rails_helper'

describe GroupChat::MessageCreationForm do
  subject(:form) do
    described_class.new(
      content: content,
      group_id: group_id,
      user_id: user_id
    )
  end

  let(:user_id)  { user.id        }
  let(:group_id) { group.id       }
  let(:content)  { 'Hello!'       }
  let(:group)    { create(:group) }
  let(:user)     { create(:user)  }

  before { Timecop.freeze(Time.utc(2020, 10, 1, 1, 0, 0)) }

  describe '#save' do
    context 'when valid data' do
      it 'saves new message' do
        expect(form.save).to be_truthy
      end
    end

    context 'when content brank' do
      let(:content) { '' }

      it 'not saves new message' do
        expect(form.save).to be_falsey
      end
    end

    context 'when user_id brank' do
      let(:user_id) { '' }

      it 'not saves new message' do
        expect(form.save).to be_falsey
      end
    end

    context 'when group_id brank' do
      let(:group_id) { '' }

      it 'not saves new message' do
        expect(form.save).to be_falsey
      end
    end
  end

  describe '#error_response' do
    before { form.save }

    context 'when content brank' do
      let(:content) { '' }

      it 'returns error data' do
        expect(form.error_response).to eq({ data: ["Content can't be blank"], type: 'message_error' })
      end
    end

    context 'when user_id brank' do
      let(:user_id) { '' }

      it 'returns error data' do
        expect(form.error_response).to eq({ data: ['User must exist', "User can't be blank"], type: 'message_error' })
      end
    end

    context 'when group_id brank' do
      let(:group_id) { '' }

      it 'returns error data' do
        expect(form.error_response).to eq({ data: ['Group must exist', "Group can't be blank"], type: 'message_error' })
      end
    end
  end
end
