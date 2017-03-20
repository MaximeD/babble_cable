class SearchesController < ApplicationController

  skip_before_action :verify_authenticity_token

  # POST /search
  def create
    messages = Message.where("text LIKE ?", "%#{params[:searched]}%")
    respond_to do |format|
      format.html { render layout:false, text: messages.pluck(:text).join('') }
    end
  end

end
