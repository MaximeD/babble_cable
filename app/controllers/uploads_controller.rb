class UploadsController < ApplicationController

  include ActionController::Live
  skip_before_action :verify_authenticity_token

  # POST /uploads
  def create
    d = RoomDocument.new

    image     = params[:image]["image"]
    d.element = image
    d.title   = image.original_filename
    d.room_id = room&.id
    d.user_id = current_user_id
    d.save

    respond_to do |format|
      format.html { render layout: false, json: { image_id: d.id, url: d.element.image_or_doc_url } }
      format.js { render json: { image_id: d.id, url: d.element.image_or_doc_url } }
      format.json { render json: { image_id: d.id, url: d.element.image_or_doc_url } }
    end
  end

  def sse_index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = SSE.new(response.stream)
    begin
      sse.write(
          render_to_string(partial: "/room_documents/sse_index", locals:{room: room}, formats: ['html'])
      )
          sleep 10

    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end

  end


  def destroy
    RoomDocument.find_by_id(params[:id])&.destroy
  end

  private

  def room_params
    params.require(:room).permit(:name, :private)
  end

  def room
    @room ||= Room.find_by(token: session[:token])
  end

end
