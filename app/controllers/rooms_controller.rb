class RoomsController < ApplicationController

  # POST /rooms
  def create
    @room = Room.new room_params

    # we need to control new and existing room at the same time
    if  @room.save
      session[:token] = @room.token
      redirect_to room_messages_path(room_id: @room.id),
        notice: t('.welcome_to_room', room: @room.name)
    else
      redirect_to root_path, alert: t('.error')
    end
  end

  def tokenize_session
    begin
      @room = Room.find_by(token: params[:id])
      session[:token] = params[:id]
      redirect_to room_messages_path(room_id: @room.id)
    rescue
      redirect_to root_path, alert: t('.error')
    end

  end

  private

  def room_params
    params.require(:room).permit(:name,:private)
  end

end
