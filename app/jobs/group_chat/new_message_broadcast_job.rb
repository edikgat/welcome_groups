# frozen_string_literal: true

module GroupChat
  class NewMessageBroadcastJob < BaseBroadcastJob
    NEW_MESSAGE_TYPE = 'message_new'
    private_constant :NEW_MESSAGE_TYPE

    attr_reader :message_id

    delegate :group_id, to: :message

    def perform(message_id)
      @message_id = message_id

      if message
        broadcast_data
      else
        log_error
      end
    end

    private

    def message
      @message ||= Message.find_by(id: message_id)
    end

    def content_json
      MessageRepresenter.new(message).as_json
    end

    def job_type
      NEW_MESSAGE_TYPE
    end

    def log_error
      Rails.logger.fatal("message with id: #{message_id} - not found")
    end
  end
end
