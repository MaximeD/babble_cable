# A {Room room} is the place where users can exchange messages.

class Room < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: true
end
