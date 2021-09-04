class GroupChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from group_chat
  end

  def unsubscribed
    stop_all_streams
  end

  def create_message(data)
    message = create_user_message_for(data)
    if message.errors.present?
      transmit({type: 'error', data: message.errors.full_messages})
    else
      GroupChat::NewMessageBroadcastJob.perform_later(message.id)
    end
  end

  private

  def create_user_message_for(data)
    current_user.messages.create(content: data['content'], group_id: data['group_id'])
  end

  def group_chat
    "group_chat_#{params['group_id']}_channel"
  end

end
