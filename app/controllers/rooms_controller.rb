class RoomsController < ApplicationController
  before_action :redirect_to_existing_room, only: %i[create]

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to room_messages_path(room_id: @room.id),
        notice: t('.welcome_to_room', room: @room.name)
    else
      redirect_to root_path, alert: t('.error')
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  # Upon creation, if room already exists, redirect user to it.
  def redirect_to_existing_room
    room = Room.find_by(name: room_params[:name])
    return unless room

    redirect_to room_messages_path(room_id: room.id),
      notice: t('.welcome_to_room', room: room.name)
  end
end
