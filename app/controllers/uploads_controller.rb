class UploadsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # POST /uploads
  def create
    d = RoomDocument.new

    image = params[:image]["image"]
    d.element = image
    d.title = image.original_filename
    d.room_id = Room.find_by(token: session[:token])&.id
    d.save
    respond_to do |format|
      format.html { render layout:false, json: {image_id: d.id, url: d.element.url} }
      format.js { render json: {image_id: d.id, url: d.url} }
      format.json { render json: {image_id: d.id, url: d.url} }
    end
  end

  private

  def room_params
    params.require(:room).permit(:name,:private)
  end

end
