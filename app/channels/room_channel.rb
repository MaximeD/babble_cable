class RoomChannel < ApplicationCable::Channel

  # Start streaming.
  def subscribed
    puts 'subscribed'
    room.update_attributes subscribers_count: room.subscribers_count + 1
    stream_from current_room
  end

  # End streaming when user unsubscribes.
  def unsubscribed
    puts 'unsubscribed'
    room.update_attributes subscribers_count: room.subscribers_count - 1
  end

  # Broadcast a message to channel.
  #
  # @param data [Hash] hash containing message to send and room
  def speak(data)
    puts 'speak'
    Message.create!(text: data['message'], room_id: data['room_id'])
  end

  private

  def current_room
    puts 'current_room'
    "room_channel-#{room.id}"
  end

  def room
    puts 'room'
    # Warning: do not memoize this action!
    # Otherwise it will be cached upon page reload and increasing / decreasing
    # subscribers will be messed up.
    Room.find(params[:room_id])
  end
end
