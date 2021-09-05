# frozen_string_literal: true

module GroupChat
  class BaseBroadcastJob < ApplicationJob
    queue_as :group_chat

    protected

    def group_id
      raise NotImplementedError
    end

    def content_json
      raise NotImplementedError
    end

    def job_type
      raise NotImplementedError
    end

    def broadcast_content
      { type: job_type, data: content_json }
    end

    def broadcast_data
      ActionCable.server.broadcast(channel_name, broadcast_content)
    end

    def channel_name
      "group_chat_#{group_id}_channel"
    end
  end
end
