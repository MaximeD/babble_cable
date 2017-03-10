# A {Message message} is some piece of text posted inside a {Room room}.
#
# A {Message message}
# * belongs to a {Room room}
#
# Attributes:
# * text [String] content of message

class Message < ApplicationRecord
  belongs_to :room

  validates :text,
    presence: true

  # Broadcasts messages into room after it has been created
  after_create_commit { MessageBroadcastJob.perform_later self }
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :text
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

