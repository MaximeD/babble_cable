# A {Message message} is some piece of text posted inside a {Room room}.
#
# Attributes:
# * text [String] content of message

class Message < ApplicationRecord
  belongs_to :room

  validates :text,
    presence: true
end
