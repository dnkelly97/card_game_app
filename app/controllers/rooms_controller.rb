class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.create_room!(:name => params[:room_name],
                         :max_players => params[:room_max_players],
                         :game_type => params[:game_type],
                         :private => params[:private])
    redirect_to room_path(@room)
  end

  def show
    id = params[:id]
    @room = Room.find(id)
  end

  def new_join
  end

  def create_join
    @room = Room.find(params[:id])
    redirect_to room_path(@room)
  end
end
