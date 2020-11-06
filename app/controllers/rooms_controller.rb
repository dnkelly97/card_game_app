class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.create!
    redirect_to room_path(@room)
  end
end
