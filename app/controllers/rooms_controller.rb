class RoomsController < ApplicationController
  def room_params
    params.require(:room).permit(:name)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create!()
    redirect_to room_path(@room)
  end

  def show
    id = params[:id]
    @room = Room.find(id)
  end
end
