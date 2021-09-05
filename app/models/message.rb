# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, :group, :content, presence: true
end
