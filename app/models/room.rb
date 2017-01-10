# A {Room room} is the place where users can exchange messages.

class Room < ApplicationRecord
  has_many :messages

  validates :name,
    presence: true,
    uniqueness: true
end
