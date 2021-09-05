# frozen_string_literal: true

class MessageRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :content
  property :user, decorator: UserRepresenter
  property :created_at_text, exec_context: :decorator

  def created_at_text
    represented.created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
