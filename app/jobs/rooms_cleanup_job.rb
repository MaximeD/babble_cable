class RoomsCleanupJob < ApplicationJob

  queue_as :default

  def perform(room)
    puts room.inspect
    puts Room.find(room.id).inspect
    room.destroy if room.subscribers_count.zero?
  end
end