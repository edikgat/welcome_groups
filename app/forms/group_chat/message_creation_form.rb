# frozen_string_literal: true

module GroupChat
  class MessageCreationForm
    MESSAGE_CREATION_ERROR_TYPE = 'error'
    private_constant :MESSAGE_CREATION_ERROR_TYPE

    attr_reader :group_id, :user_id, :content

    delegate :save, to: :message

    def initialize(group_id:, user_id:, content:)
      @group_id = group_id
      @user_id = user_id
      @content = content
    end

    def message
      @message ||= Message.new(content: content, group_id: group_id, user_id: user_id)
    end

    def error_response
      { type: 'error', data: message.errors.full_messages }
    end
  end
end
