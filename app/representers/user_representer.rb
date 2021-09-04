class UserRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :login
end
