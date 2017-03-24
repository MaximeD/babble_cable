class SearchesController < ApplicationController

  skip_before_action :verify_authenticity_token

  # POST /search
  def create
    #TODO:  appliquer mine! sur room_id
    @messages = Message.where(room_id:params[:room_id]).where("text LIKE ?", "%#{params[:searched]}%")
    respond_to do |format|
      format.html { render layout:false }
    end
  end

end
