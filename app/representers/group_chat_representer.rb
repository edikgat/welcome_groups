# frozen_string_literal: true

require 'roar/json'
require 'roar/decorator'

class GroupChatRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :name

  collection :messages, decorator: MessageRepresenter, class: Message
end
