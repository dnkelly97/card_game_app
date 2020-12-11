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
    discard_pile = Pile.create!(name: "Discard Pile", creator: "The Game", private_pile: true, card_count: 0, room_id: @room.id)
    @room.piles << @pile
    @room.piles << discard_pile
    Card.create([{name: "Ace of Spades", pile_id: @pile.id, unicode_value: "1F0A1"},
                 {name: "Two of Spades", pile_id: @pile.id, unicode_value: "1F0A2"},
                 {name: "Three of Spades", pile_id: @pile.id, unicode_value: "1F0A3"},
                 {name: "Four of Spades", pile_id: @pile.id, unicode_value: "1F0A4"},
                 {name: "Five of Spades", pile_id: @pile.id, unicode_value: "1F0A5"},
                 {name: "Six of Spades", pile_id: @pile.id, unicode_value: "1F0A6"},
                 {name: "Seven of Spades", pile_id: @pile.id, unicode_value: "1F0A7"},
                 {name: "Eight of Spades", pile_id: @pile.id, unicode_value: "1F0A8"},
                 {name: "Nine of Spades", pile_id: @pile.id, unicode_value: "1F0A9"},
                 {name: "Ten of Spades", pile_id: @pile.id, unicode_value: "1F0AA"},
                 {name: "Jack of Spades", pile_id: @pile.id, unicode_value: "1F0AB"},
                 {name: "Queen of Spades", pile_id: @pile.id, unicode_value: "1F0AD"},
                 {name: "King of Spades", pile_id: @pile.id, unicode_value: "1F0AE"},
                 {name: "Ace of Hearts", pile_id: @pile.id, unicode_value: "1F0B1"},
                 {name: "Two of Hearts", pile_id: @pile.id, unicode_value: "1F0B2"},
                 {name: "Three of Hearts", pile_id: @pile.id, unicode_value: "1F0B3"},
                 {name: "Four of Hearts", pile_id: @pile.id,unicode_value: "1F0B4"},
                 {name: "Five of Hearts", pile_id: @pile.id, unicode_value: "1F0B5"},
                 {name: "Six of Hearts", pile_id: @pile.id, unicode_value: "1F0B6"},
                 {name: "Seven of Hearts", pile_id: @pile.id, unicode_value: "1F0B7"},
                 {name: "Eight of Hearts", pile_id: @pile.id, unicode_value: "1F0B8"},
                 {name: "Nine of Hearts", pile_id: @pile.id, unicode_value: "1F0B9"},
                 {name: "Ten of Hearts", pile_id: @pile.id, unicode_value: "1F0BA"},
                 {name: "Jack of Hearts", pile_id: @pile.id, unicode_value: "1F0BB"},
                 {name: "Queen of Hearts", pile_id: @pile.id, unicode_value: "1F0BD"},
                 {name: "King of Hearts", pile_id: @pile.id, unicode_value: "1F0BE"},
                 {name: "Ace of Clubs", pile_id: @pile.id, unicode_value: "1F0D1"},
                 {name: "Two of Clubs", pile_id: @pile.id, unicode_value: "1F0D2"},
                 {name: "Three of Clubs", pile_id: @pile.id, unicode_value: "1F0D3"},
                 {name: "Four of Clubs", pile_id: @pile.id, unicode_value: "1F0D4"},
                 {name: "Five of Clubs", pile_id: @pile.id, unicode_value: "1F0D5"},
                 {name: "Six of Clubs", pile_id: @pile.id, unicode_value: "1F0D6"},
                 {name: "Seven of Clubs", pile_id: @pile.id, unicode_value: "1F0D7"},
                 {name: "Eight of Clubs", pile_id: @pile.id, unicode_value: "1F0D8"},
                 {name: "Nine of Clubs", pile_id: @pile.id, unicode_value: "1F0D9"},
                 {name: "Ten of Clubs", pile_id: @pile.id, unicode_value: "1F0DA"},
                 {name: "Jack of Clubs", pile_id: @pile.id, unicode_value: "1F0DB"},
                 {name: "Queen of Clubs", pile_id: @pile.id, unicode_value: "1F0DD"},
                 {name: "King of Clubs", pile_id: @pile.id, unicode_value: "1F0DE"},
                 {name: "Ace of Diamonds", pile_id: @pile.id, unicode_value: "1F0C1"},
                 {name: "Two of Diamonds", pile_id: @pile.id, unicode_value: "1F0C2"},
                 {name: "Three of Diamonds", pile_id: @pile.id, unicode_value: "1F0C3"},
                 {name: "Four of Diamonds", pile_id: @pile.id, unicode_value: "1F0C4"},
                 {name: "Five of Diamonds", pile_id: @pile.id, unicode_value: "1F0C5"},
                 {name: "Six of Diamonds", pile_id: @pile.id, unicode_value: "1F0C6"},
                 {name: "Seven of Diamonds", pile_id: @pile.id, unicode_value: "1F0C7"},
                 {name: "Eight of Diamonds", pile_id: @pile.id, unicode_value: "1F0C8"},
                 {name: "Nine of Diamonds", pile_id: @pile.id, unicode_value: "1F0C9"},
                 {name: "Ten of Diamonds", pile_id: @pile.id, unicode_value: "1F0CA"},
                 {name: "Jack of Diamonds", pile_id: @pile.id, unicode_value: "1F0CB"},
                 {name: "Queen of Diamonds", pile_id: @pile.id, unicode_value: "1F0CD"},
                 {name: "King of Diamonds", pile_id: @pile.id, unicode_value: "1F0CE"}
                ])
    @room.piles << pile

    [1,2,3,4,5,6,7,8,9,10].map{|index| Pile.create(name: "General #{index}", creator: "The Game", private_pile: false, card_count: 0, room_id: @room.id) }
    Pile.create(name: "Discard Pile", creator: "The Game", private_pile: false, card_count: 0, room_id: @room.id)

    @room.save!
    flash[:notice] = "Welcome to your newly created room, #{@room.name}"
    redirect_to room_path(@room)
  end

  def show
    id = params[:id]
    @room = Room.find(id)
    @draw_pile = Pile.where(room_id: @room.id, name: "Deck", creator: "The Game").first
    @draw_cards = translate_cards_to_array(Card.where(pile_id: @draw_pile.id))
    @discard_pile = Pile.where(room_id: @room.id, name: "Discard Pile", creator: "The Game").first
    @discard_cards = translate_cards_to_array(Card.where(pile_id: @discard_pile.id))
    @center_piles = {}
    # Pile.where("name = ? AND room_id = ? AND creator = ?", "%General%",  @room.id, "The Game").each do |pile|
    Pile.where(:room_id => @room, :creator => "The Game").each do |pile|
      if pile.name.include?("General")
        cards_in_pile = translate_cards_to_array(Card.where(pile_id: pile.id))
        @center_piles[pile.name] = cards_in_pile
      end
    end

    @piles = Pile.all

    user_pile = Pile.where(room_id: @room, creator: @current_user.user_id)[0]
    user_cards = Card.where(pile_id: user_pile.id)
    @fan = user_cards.length <= 13
    @card_list = translate_cards_to_array(user_cards)
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
        pile = Pile.create(name: "#{@current_user.user_id}'s Hand", creator: @current_user.user_id, private_pile: true, card_count: 0)
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

  private

  def translate_cards_to_array(card_list)
    card_list.map do |card|
      if card.name.split[2] == "Diamonds"
        suit = "diams"
      else
        suit = card.name.split[2].downcase
      end
      card_name = translate_rank(card.name.split[0])
      [card_name, suit]
    end
  end

  def translate_rank(rank)
    case rank
      when "Ace"
        "A"
      when "Two"
        "2"
      when "Three"
        "3"
      when "Four"
        "4"
      when "Five"
        "5"
      when "Six"
        "6"
      when "Seven"
        "7"
      when "Eight"
        "8"
      when "Nine"
        "9"
      when "Ten"
        "10"
      when "Jack"
        "J"
      when "Queen"
        "Q"
      when "King"
        "K"
    end
  end
end
