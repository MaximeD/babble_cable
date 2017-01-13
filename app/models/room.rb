# A {Room room} is the place where users can exchange messages.

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
