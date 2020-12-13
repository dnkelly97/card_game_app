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
    discard_pile = Pile.create!(name: "Discard Pile", creator: "The Game", private_pile: false , card_count: 0, room_id: @room.id)
    @room.piles << @pile
    @room.piles << discard_pile
    Card.create([{name: "Ace of Spades", pile_id: @pile.id, unicode_value: "1F0A1", suit: "spades", rank: "A"},
                 {name: "Two of Spades", pile_id: @pile.id, unicode_value: "1F0A2", suit: "spades", rank: "2"},
                 {name: "Three of Spades", pile_id: @pile.id, unicode_value: "1F0A3", suit: "spades", rank: "3"},
                 {name: "Four of Spades", pile_id: @pile.id, unicode_value: "1F0A4", suit: "spades", rank: "4"},
                 {name: "Five of Spades", pile_id: @pile.id, unicode_value: "1F0A5", suit: "spades", rank: "5"},
                 {name: "Six of Spades", pile_id: @pile.id, unicode_value: "1F0A6", suit: "spades", rank: "6"},
                 {name: "Seven of Spades", pile_id: @pile.id, unicode_value: "1F0A7", suit: "spades", rank: "7"},
                 {name: "Eight of Spades", pile_id: @pile.id, unicode_value: "1F0A8", suit: "spades", rank: "8"},
                 {name: "Nine of Spades", pile_id: @pile.id, unicode_value: "1F0A9", suit: "spades", rank: "9"},
                 {name: "Ten of Spades", pile_id: @pile.id, unicode_value: "1F0AA", suit: "spades", rank: "10"},
                 {name: "Jack of Spades", pile_id: @pile.id, unicode_value: "1F0AB", suit: "spades", rank: "J"},
                 {name: "Queen of Spades", pile_id: @pile.id, unicode_value: "1F0AD", suit: "spades", rank: "Q"},
                 {name: "King of Spades", pile_id: @pile.id, unicode_value: "1F0AE", suit: "spades", rank: "K"},
                 {name: "Ace of Hearts", pile_id: @pile.id, unicode_value: "1F0B1", suit: "hearts", rank: "A"},
                 {name: "Two of Hearts", pile_id: @pile.id, unicode_value: "1F0B2", suit: "hearts", rank: "2"},
                 {name: "Three of Hearts", pile_id: @pile.id, unicode_value: "1F0B3", suit: "hearts", rank: "3"},
                 {name: "Four of Hearts", pile_id: @pile.id,unicode_value: "1F0B4", suit: "hearts", rank: "4"},
                 {name: "Five of Hearts", pile_id: @pile.id, unicode_value: "1F0B5", suit: "hearts", rank: "5"},
                 {name: "Six of Hearts", pile_id: @pile.id, unicode_value: "1F0B6", suit: "hearts", rank: "6"},
                 {name: "Seven of Hearts", pile_id: @pile.id, unicode_value: "1F0B7", suit: "hearts", rank: "7"},
                 {name: "Eight of Hearts", pile_id: @pile.id, unicode_value: "1F0B8", suit: "hearts", rank: "8"},
                 {name: "Nine of Hearts", pile_id: @pile.id, unicode_value: "1F0B9", suit: "hearts", rank: "9"},
                 {name: "Ten of Hearts", pile_id: @pile.id, unicode_value: "1F0BA", suit: "hearts", rank: "10"},
                 {name: "Jack of Hearts", pile_id: @pile.id, unicode_value: "1F0BB", suit: "hearts", rank: "J"},
                 {name: "Queen of Hearts", pile_id: @pile.id, unicode_value: "1F0BD", suit: "hearts", rank: "Q"},
                 {name: "King of Hearts", pile_id: @pile.id, unicode_value: "1F0BE", suit: "hearts", rank: "K"},
                 {name: "Ace of Clubs", pile_id: @pile.id, unicode_value: "1F0D1", suit: "clubs", rank: "A"},
                 {name: "Two of Clubs", pile_id: @pile.id, unicode_value: "1F0D2", suit: "clubs", rank: "2"},
                 {name: "Three of Clubs", pile_id: @pile.id, unicode_value: "1F0D3", suit: "clubs", rank: "3"},
                 {name: "Four of Clubs", pile_id: @pile.id, unicode_value: "1F0D4", suit: "clubs", rank: "4"},
                 {name: "Five of Clubs", pile_id: @pile.id, unicode_value: "1F0D5", suit: "clubs", rank: "5"},
                 {name: "Six of Clubs", pile_id: @pile.id, unicode_value: "1F0D6", suit: "clubs", rank: "6"},
                 {name: "Seven of Clubs", pile_id: @pile.id, unicode_value: "1F0D7", suit: "clubs", rank: "7"},
                 {name: "Eight of Clubs", pile_id: @pile.id, unicode_value: "1F0D8", suit: "clubs", rank: "8"},
                 {name: "Nine of Clubs", pile_id: @pile.id, unicode_value: "1F0D9", suit: "clubs", rank: "9"},
                 {name: "Ten of Clubs", pile_id: @pile.id, unicode_value: "1F0DA", suit: "clubs", rank: "10"},
                 {name: "Jack of Clubs", pile_id: @pile.id, unicode_value: "1F0DB", suit: "clubs", rank: "J"},
                 {name: "Queen of Clubs", pile_id: @pile.id, unicode_value: "1F0DD", suit: "clubs", rank: "Q"},
                 {name: "King of Clubs", pile_id: @pile.id, unicode_value: "1F0DE", suit: "clubs", rank: "K"},
                 {name: "Ace of Diamonds", pile_id: @pile.id, unicode_value: "1F0C1", suit: "diams", rank: "A"},
                 {name: "Two of Diamonds", pile_id: @pile.id, unicode_value: "1F0C2", suit: "diams", rank: "2"},
                 {name: "Three of Diamonds", pile_id: @pile.id, unicode_value: "1F0C3", suit: "diams", rank: "3"},
                 {name: "Four of Diamonds", pile_id: @pile.id, unicode_value: "1F0C4", suit: "diams", rank: "4"},
                 {name: "Five of Diamonds", pile_id: @pile.id, unicode_value: "1F0C5", suit: "diams", rank: "5"},
                 {name: "Six of Diamonds", pile_id: @pile.id, unicode_value: "1F0C6", suit: "diams", rank: "6"},
                 {name: "Seven of Diamonds", pile_id: @pile.id, unicode_value: "1F0C7", suit: "diams", rank: "7"},
                 {name: "Eight of Diamonds", pile_id: @pile.id, unicode_value: "1F0C8", suit: "diams", rank: "8"},
                 {name: "Nine of Diamonds", pile_id: @pile.id, unicode_value: "1F0C9", suit: "diams", rank: "9"},
                 {name: "Ten of Diamonds", pile_id: @pile.id, unicode_value: "1F0CA", suit: "diams", rank: "10"},
                 {name: "Jack of Diamonds", pile_id: @pile.id, unicode_value: "1F0CB", suit: "diams", rank: "J"},
                 {name: "Queen of Diamonds", pile_id: @pile.id, unicode_value: "1F0CD", suit: "diams", rank: "Q"},
                 {name: "King of Diamonds", pile_id: @pile.id, unicode_value: "1F0CE", suit: "diams", rank: "K"}
                ])
    @room.piles << pile

    [1,2,3,4,5,6,7,8,9,10].map{|index| Pile.create(name: "General #{index}", creator: "The Game", private_pile: false, card_count: 0, room_id: @room.id) }
    # Pile.create(name: "Discard Pile", creator: "The Game", private_pile: false, card_count: 0, room_id: @room.id)

    @room.save!
    flash[:notice] = "Welcome to your newly created room, #{@room.name}"
    redirect_to room_path(@room)
  end

  def show
    id = params[:id]
    @room = Room.find(id)
    @draw_pile = Pile.where(room_id: @room.id, name: "Deck", creator: "The Game").first
    @draw_cards = translate_cards_to_array(Card.where(pile_id: @draw_pile.id))
    @discard_pile = Pile.find_by(room_id: @room.id, name: "Discard Pile", creator: "The Game")
    @center_piles = []
    Pile.where(:room_id => @room, :creator => "The Game").each do |pile|
      if pile.name.include?("General")
        @center_piles << pile
      end
    end

    @piles = Pile.all
    user_hand_name = "#{@current_user.user_id}'s Hand"
    @user_hand = Pile.find_by(room_id: id, name: user_hand_name)
    user_cards = Card.where(pile_id: @user_hand.id)
    @fan = user_cards.length <= 13

    @card_list = translate_cards_to_array(user_cards)
    render partial: 'show_game_room' if request.xhr?
  end

  def new_join
  end

  def create_join
    begin
      @room = Room.find_by!(:room_code => params[:id])
      existing_user_hand_query = Pile.where(name: "#{@current_user.user_id}'s Hand", room_id: "#{@room.id}")
      unless existing_user_hand_query.empty?
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

  def show_hand
    room_id = @current_user.room_id
    user_hand = "#{@current_user.user_id}'s Hand"
    pile = Pile.find_by(room_id: room_id, name: user_hand)
    if pile.private_pile
      pile.private_pile = false
      pile.save
      render partial: 'partials/hide_hand' if request.xhr?
    else
      pile.private_pile = true
      pile.save
      render partial: 'partials/show_hand' if request.xhr?
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
