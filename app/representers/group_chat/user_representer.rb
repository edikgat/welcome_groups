# frozen_string_literal: true

require 'roar/json'
require 'roar/decorator'

module GroupChat
  class UserRepresenter < Roar::Decorator
    include Roar::JSON

    property :id
    property :login
  end
end
