class RoomChannel < ApplicationCable::Channel

  # Start streaming.
  def subscribed
    stream_from current_room
  end

  # End streaming when use unsubscribes.
  def unsubscribed
  end

  # Broadcast a message to channel.
  #
  # @param [Hash] data: hash containing message to send
  def speak(data)
    ActionCable.server.broadcast current_room, message: data['message']
  end

  private

  def current_room
    "room_channel-#{params[:room_id]}"
  end
end
