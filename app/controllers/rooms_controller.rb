class RoomsController < ApplicationController
  before_action :set_current_user
  def new
  end

  def create
    @room = Room.create_room!(:name => params[:room_name],
                         :max_players => params[:max_players],
                         :game_type => params[:game_type],
                         :private => params[:private])
    user = User.find_by_session_token(session[:session_token])
    @room.users << @current_user
    @room.save!
    room = Room.find_by(:id => @current_user.room_id)
    flash[:notice] = "#{@current_user.user_id}, welcome to #{room.name}"
    redirect_to room_path(@room)
  end

  def show
    id = params[:id]
    @room = Room.find(id)
    @piles = Pile.all
  end

  def new_join
  end

  def create_join
    begin
      @room = Room.find_by!(:room_code => params[:id])
      user = User.find_by_session_token(session[:session_token])
      @room.users << @current_user
      @room.save!
      room = Room.find_by(:id => @current_user.room_id)
      flash[:notice] = "#{@current_user.user_id}, welcome to #{room.name}"
      redirect_to room_path(@room)
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "A room with that code does not exist."
      redirect_to rooms_new_join_path
    end
  end
end
