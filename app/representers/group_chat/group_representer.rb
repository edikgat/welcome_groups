# frozen_string_literal: true

require 'roar/json'
require 'roar/decorator'

module GroupChat
  class GroupRepresenter < Roar::Decorator
    include Roar::JSON

    property :id
    property :name

    collection :messages, decorator: MessageRepresenter, class: Message
  end
end
