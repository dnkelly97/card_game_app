class RoomsController < ApplicationController
  def new
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
    begin
      @room = Room.find_by!(:room_code => params[:id])
      redirect_to room_path(@room)
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "A room with that code does not exist."
      redirect_to rooms_new_join_path
    end
  end

  def show_piles
    @piles = Pile.all
    @unicode = "1F0A1"
  end
end
