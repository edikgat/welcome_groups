# frozen_string_literal: true

class GroupChatChannel < ApplicationCable::Channel
  def subscribed
    if Group.exists?(id: params['group_id'])
      stream_from(group_chat)
    else
      reject
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def create_message(data)
    form = GroupChat::MessageCreationForm.new(
      content: data['content'],
      group_id: params[:group_id],
      user_id: current_user.id
    )
    if form.save
      GroupChat::NewMessageBroadcastJob.perform_later(form.message.id)
    else
      transmit(form.error_response)
    end
  end

  private

  def group_chat
    "group_chat_#{params['group_id']}_channel"
  end
end
