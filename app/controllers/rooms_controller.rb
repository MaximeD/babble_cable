class RoomsController < ApplicationController

  # GET /
  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
