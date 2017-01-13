# A {Room room} is the place where users can exchange messages.
#
# A {Room room}
# * has_many {Message messages}
#
# Attributes:
# * name [String] name of the room
# * subscribers_count [Integer] number of users subscribed to channel

class Room < ApplicationRecord
  after_update :destroy_empty_room

  has_many :messages, dependent: :destroy

  validates :name,
    presence: true,
    uniqueness: true

  private

  # When a room is empty, il should be destroyed.
  def destroy_empty_room
    destroy if subscribers_count.zero?
  end
end
