class RoomsController < ApplicationController

  # POST /rooms
  def create
    @room = Room.find_or_create_by(name: room_params[:name])

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

end
