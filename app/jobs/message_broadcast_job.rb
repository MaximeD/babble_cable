class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # Broadcasts message to its room.
  #
  # @param [Message] the message to broadcast
  def perform(message)
    ActionCable.server.broadcast current_room_for(message), message: message.text
  end

  private

  def current_room_for(message)
    "room_channel-#{message.room_id}"
  end
end
