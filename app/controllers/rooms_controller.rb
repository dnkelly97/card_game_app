class RoomsController < ApplicationController
  before_action :set_current_user
  def new
  end

  def create
    @room = Room.create_room!(:name => params[:room_name],
                         :max_players => params[:max_players],
                         :game_type => params[:game_type],
                         :private => params[:private])
    @room.users << @current_user
    pile = Pile.create(name: "#{@current_user.user_id}'s Hand", creator: @current_user.user_id, private_pile: true, card_count: 0)
    @pile = Pile.create!(name: "Deck", creator: "The Game", private_pile: true, card_count: 52, room_id: @room.id)
    @room.piles << @pile
    Card.create([{name: "Ace of Spades", pile_id: @pile.id},
                 {name: "Two of Spades", pile_id: @pile.id},
                 {name: "Three of Spades", pile_id: @pile.id},
                 {name: "Four of Spades", pile_id: @pile.id},
                 {name: "Five of Spades", pile_id: @pile.id},
                 {name: "Six of Spades", pile_id: @pile.id},
                 {name: "Seven of Spades", pile_id: @pile.id},
                 {name: "Eight of Spades", pile_id: @pile.id},
                 {name: "Nine of Spades", pile_id: @pile.id},
                 {name: "Ten of Spades", pile_id: @pile.id},
                 {name: "Jack of Spades", pile_id: @pile.id},
                 {name: "Queen of Spades", pile_id: @pile.id},
                 {name: "King of Spades", pile_id: @pile.id},
                 {name: "Ace of Hearts", pile_id: @pile.id},
                 {name: "Two of Hearts", pile_id: @pile.id},
                 {name: "Three of Hearts", pile_id: @pile.id},
                 {name: "Four of Hearts", pile_id: @pile.id},
                 {name: "Five of Hearts", pile_id: @pile.id},
                 {name: "Six of Hearts", pile_id: @pile.id},
                 {name: "Seven of Hearts", pile_id: @pile.id},
                 {name: "Eight of Hearts", pile_id: @pile.id},
                 {name: "Nine of Hearts", pile_id: @pile.id},
                 {name: "Ten of Hearts", pile_id: @pile.id},
                 {name: "Jack of Hearts", pile_id: @pile.id},
                 {name: "Queen of Hearts", pile_id: @pile.id},
                 {name: "King of Hearts", pile_id: @pile.id},
                 {name: "Ace of Clubs", pile_id: @pile.id},
                 {name: "Two of Clubs", pile_id: @pile.id},
                 {name: "Three of Clubs", pile_id: @pile.id},
                 {name: "Four of Clubs", pile_id: @pile.id},
                 {name: "Five of Clubs", pile_id: @pile.id},
                 {name: "Six of Clubs", pile_id: @pile.id},
                 {name: "Seven of Clubs", pile_id: @pile.id},
                 {name: "Eight of Clubs", pile_id: @pile.id},
                 {name: "Nine of Clubs", pile_id: @pile.id},
                 {name: "Ten of Clubs", pile_id: @pile.id},
                 {name: "Jack of Clubs", pile_id: @pile.id},
                 {name: "Queen of Clubs", pile_id: @pile.id},
                 {name: "King of Clubs", pile_id: @pile.id},
                 {name: "Ace of Diamonds", pile_id: @pile.id},
                 {name: "Two of Diamonds", pile_id: @pile.id},
                 {name: "Three of Diamonds", pile_id: @pile.id},
                 {name: "Four of Diamonds", pile_id: @pile.id},
                 {name: "Five of Diamonds", pile_id: @pile.id},
                 {name: "Six of Diamonds", pile_id: @pile.id},
                 {name: "Seven of Diamonds", pile_id: @pile.id},
                 {name: "Eight of Diamonds", pile_id: @pile.id},
                 {name: "Nine of Diamonds", pile_id: @pile.id},
                 {name: "Ten of Diamonds", pile_id: @pile.id},
                 {name: "Jack of Diamonds", pile_id: @pile.id},
                 {name: "Queen of Diamonds", pile_id: @pile.id},
                 {name: "King of Diamonds", pile_id: @pile.id}
                ])
    @room.piles << pile
    @room.save!
    flash[:notice] = "Welcome to your newly created room, #{@room.name}"
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
      if @current_user.room_id == @room.id
        flash[:notice] = "#{@current_user.user_id}, welcome back to #{@room.name}"
        redirect_to room_path(@room) and return
      end
      if @room.users.count < @room.max_players
        @room.users << @current_user
        pile = Pile.create(name: "#{@current_user.name}'s Hand", creator: @current_user, private_pile: true, card_count: 0)
        @room.piles << pile
        @room.save!
        flash[:notice] = "#{@current_user.user_id}, welcome to #{@room.name}"
        redirect_to room_path(@room)
      else
        flash[:notice] = "Sorry, #{@room.name} is already at full capacity"
        redirect_to dashboard_path
      end
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "A room with that code does not exist."
      redirect_to rooms_new_join_path
    end
  end
end
