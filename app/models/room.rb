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
  before_create :add_token

  has_many :messages, dependent: :destroy

  validates :name,
    presence: true,
    uniqueness: true

  def authorized?(session_token)

    # nothing to do if public
    return true if self.public?

    # new record: all's good !
    return true if self.new_record?

    # if coming from outside, we must show a valid token
    session_token == self.token
  end

  def authorize!(session_token)
    raise "unauthorized!" if self.private? && session_token != self.token
  end

  def public?
    !private?
  end

  private

  # token used to share by link to others
  def add_token
    self.token = SecureRandom.base64(20)
  end

  # When a room is empty, il should be destroyed.
  def destroy_empty_room
    destroy if subscribers_count.zero?
  end
end
