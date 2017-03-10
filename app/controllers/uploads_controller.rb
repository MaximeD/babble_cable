class UploadsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # POST /uploads
  def create
   raise params.inspect
  end

  private

  def room_params
    params.require(:room).permit(:name,:private)
  end

end
