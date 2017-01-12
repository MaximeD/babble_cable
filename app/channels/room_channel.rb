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
  # @param [Hash] data: hash containing message to send and room
  def speak(data)
    Message.create!(text: data['message'], room_id: data['room_id'])
  end

  private

  def current_room
    "room_channel-#{params[:room_id]}"
  end
end
