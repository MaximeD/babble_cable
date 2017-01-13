class MessagesController < ApplicationController

  # GET /rooms/:room_id/messages
  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages.order(created_at: :desc).limit(20)
  end
end
