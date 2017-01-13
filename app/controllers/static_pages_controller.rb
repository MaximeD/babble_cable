class StaticPagesController < ApplicationController
  def index
    @room = Room.new
  end
end
