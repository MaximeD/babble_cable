class RoomChannel < ApplicationCable::Channel

  # Start streaming.
  def subscribed
    room.update_attributes subscribers_count: room.subscribers_count + 1
    stream_from current_room
  end

  # End streaming when use unsubscribes.
  def unsubscribed
    room.update_attributes subscribers_count: room.subscribers_count - 1
  end

  # Broadcast a message to channel.
  #
  # @param [Hash] data: hash containing message to send and room
  def speak(data)
    Message.create!(text: data['message'], room_id: data['room_id'])
  end

  private

  def current_room
    "room_channel-#{room.id}"
  end

  def room
    # Warning: do not memoize this action!
    # Otherwise it will be cached upon page reload and increasing / decreasing
    # subscribers will be messed up.
    Room.find(params[:room_id])
  end
end
