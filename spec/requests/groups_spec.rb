# frozen_string_literal: true

require 'rails_helper'

describe 'Groups', type: :request do
  let(:user) { create(:user, login: 'CurrentUser') }
  let(:save_group) do
    visit path
    within('form') do
      fill_in 'Name', with: new_name
      click_button 'Save'
    end
  end

  before { login_as(user) }

  describe '#new' do
    let(:path) { new_group_path }

    context 'when valid name' do
      let(:new_name) { 'NewGroupName' }

      it 'creates new group' do
        save_group
        expect(page).to have_content('Group was successfully created')
        expect(page).to have_current_path(groups_path)
        expect(page).to have_link('Edit')
        expect(page).to have_link(new_name)
        expect(page).to have_link('Destroy')
      end
    end

    context 'when name blank' do
      let(:new_name) { '' }

      it 'shows error message' do
        save_group
        expect(page).to have_content("Name can't be blank.")
      end
    end
  end

  describe '#edit' do
    let(:group)    { create(:group, name: 'OldGroupName', owner: user) }
    let(:new_name) { 'NewGroupName'                                    }
    let(:path)     { edit_group_path(group)                            }

    context 'when valid name' do
      let(:new_name) { 'NewGroupName' }

      it 'updates group' do
        save_group
        expect(page).to have_content('Group was successfully updated')
        expect(page).to have_current_path(groups_path)
        expect(page).to have_selector('td', text: new_name)
      end

      it 'enqueues job' do
        expect { save_group }
          .to(
            have_enqueued_job(GroupChat::GroupRenamedBroadcastJob).on_queue('group_chat').with(group.id)
          )
      end
    end

    context 'when name blank' do
      let(:new_name) { '' }

      it 'shows error message' do
        save_group
        expect(page).to have_content("Name can't be blank.")
      end

      it 'not enques job' do
        expect { save_group }
          .not_to have_enqueued_job(GroupChat::NewMessageBroadcastJob)
      end
    end
  end

  describe '#index' do
    let(:group_name) { 'GroupName' }

    before do
      group
      visit groups_path
    end

    shared_examples 'has link to chat' do
      it do
        expect(page).to have_link(group_name)
      end
    end

    context 'when group owner' do
      let(:group) { create(:group, owner: user, name: group_name) }

      it 'has edit & destroy links' do
        expect(page).to have_link('Edit')
        expect(page).to have_link('Destroy')
      end

      it_behaves_like 'has link to chat'
    end

    context 'when not group owner' do
      let(:group) { create(:group, name: group_name) }

      it 'has edit & destroy links' do
        expect(page).to have_no_link('Edit')
        expect(page).to have_no_link('Destroy')
      end

      it_behaves_like 'has link to chat'
    end
  end

  describe '#destroy' do
    let!(:group) { create(:group, owner: user) }

    it 'destroys group' do
      visit groups_path
      accept_confirm do
        click_link 'Destroy'
      end
      expect(page).to have_content('Group was successfully removed')
      expect(page).to have_current_path(groups_path)
      expect(page).to have_no_link(group.name)
    end
  end

  describe '#show' do
    let!(:other_user) { create(:user, login: 'OtherUser') }
    let!(:group)              { create(:group, owner: user, name: 'ShowGroup')                           }
    let!(:owner_message)      { create(:message, user: user, group: group, content: 'HelloFromOwner')    }
    let!(:other_user_message) { create(:message, group: group, user: other_user, content: 'TestMessage') }

    it 'show group' do
      visit group_path(group)

      within('.group-chat-left') do
        expect(page).to have_content('TestMessage')
        expect(page).to have_content('OtherUser')
      end
      within('.group-chat-right') do
        expect(page).to have_content('HelloFromOwner')
        expect(page).to have_content('CurrentUser')
      end
      expect(page).to have_content('ShowGroup')
    end
  end
end
