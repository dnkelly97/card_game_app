class PilesController < ApplicationController
  before_action :set_current_user
  protect_from_forgery with: :null_session
  # def pile_params
  #   params.require(:pile).permit(:name, :private_pile, :creator)
  # end
  def index
    @piles = Pile.all
  end

  def new
    render(partial: 'partials/create_pile') if request.xhr?
  end
  def new_deck

  end
  # def create_deck
  #   #room_id = params[:room_id]
  #   room = Room.find_by(id: params[:room_id])
  #   @pile = Pile.create!(name: "Deck", creator: "The Game", private_pile: true, card_count: 52, room_id: params[:room_id])
  #   room.piles << @pile
  #   Card.create([{name: "Ace of Spades", pile_id: @pile.id, unicode_value: "1F0A1", suit: "spades", rank: "A"},
  #                {name: "Two of Spades", pile_id: @pile.id, unicode_value: "1F0A2", suit: "spades", rank: "2"},
  #                {name: "Three of Spades", pile_id: @pile.id, unicode_value: "1F0A3", suit: "spades", rank: "3"},
  #                {name: "Four of Spades", pile_id: @pile.id, unicode_value: "1F0A4", suit: "spades", rank: "4"},
  #                {name: "Five of Spades", pile_id: @pile.id, unicode_value: "1F0A5", suit: "spades", rank: "5"},
  #                {name: "Six of Spades", pile_id: @pile.id, unicode_value: "1F0A6", suit: "spades", rank: "6"},
  #                {name: "Seven of Spades", pile_id: @pile.id, unicode_value: "1F0A7", suit: "spades", rank: "7"},
  #                {name: "Eight of Spades", pile_id: @pile.id, unicode_value: "1F0A8", suit: "spades", rank: "8"},
  #                {name: "Nine of Spades", pile_id: @pile.id, unicode_value: "1F0A9", suit: "spades", rank: "9"},
  #                {name: "Ten of Spades", pile_id: @pile.id, unicode_value: "1F0AA", suit: "spades", rank: "10"},
  #                {name: "Jack of Spades", pile_id: @pile.id, unicode_value: "1F0AB", suit: "spades", rank: "J"},
  #                {name: "Queen of Spades", pile_id: @pile.id, unicode_value: "1F0AD", suit: "spades", rank: "Q"},
  #                {name: "King of Spades", pile_id: @pile.id, unicode_value: "1F0AE", suit: "spades", rank: "K"},
  #                {name: "Ace of Hearts", pile_id: @pile.id, unicode_value: "1F0B1", suit: "hearts", rank: "A"},
  #                {name: "Two of Hearts", pile_id: @pile.id, unicode_value: "1F0B2", suit: "hearts", rank: "2"},
  #                {name: "Three of Hearts", pile_id: @pile.id, unicode_value: "1F0B3", suit: "hearts", rank: "3"},
  #                {name: "Four of Hearts", pile_id: @pile.id,unicode_value: "1F0B4", suit: "hearts", rank: "4"},
  #                {name: "Five of Hearts", pile_id: @pile.id, unicode_value: "1F0B5", suit: "hearts", rank: "5"},
  #                {name: "Six of Hearts", pile_id: @pile.id, unicode_value: "1F0B6", suit: "hearts", rank: "6"},
  #                {name: "Seven of Hearts", pile_id: @pile.id, unicode_value: "1F0B7", suit: "hearts", rank: "7"},
  #                {name: "Eight of Hearts", pile_id: @pile.id, unicode_value: "1F0B8", suit: "hearts", rank: "8"},
  #                {name: "Nine of Hearts", pile_id: @pile.id, unicode_value: "1F0B9", suit: "hearts", rank: "9"},
  #                {name: "Ten of Hearts", pile_id: @pile.id, unicode_value: "1F0BA", suit: "hearts", rank: "10"},
  #                {name: "Jack of Hearts", pile_id: @pile.id, unicode_value: "1F0BB", suit: "hearts", rank: "J"},
  #                {name: "Queen of Hearts", pile_id: @pile.id, unicode_value: "1F0BD", suit: "hearts", rank: "Q"},
  #                {name: "King of Hearts", pile_id: @pile.id, unicode_value: "1F0BE", suit: "hearts", rank: "K"},
  #                {name: "Ace of Clubs", pile_id: @pile.id, unicode_value: "1F0D1", suit: "clubs", rank: "A"},
  #                {name: "Two of Clubs", pile_id: @pile.id, unicode_value: "1F0D2", suit: "clubs", rank: "2"},
  #                {name: "Three of Clubs", pile_id: @pile.id, unicode_value: "1F0D3", suit: "clubs", rank: "3"},
  #                {name: "Four of Clubs", pile_id: @pile.id, unicode_value: "1F0D4", suit: "clubs", rank: "4"},
  #                {name: "Five of Clubs", pile_id: @pile.id, unicode_value: "1F0D5", suit: "clubs", rank: "5"},
  #                {name: "Six of Clubs", pile_id: @pile.id, unicode_value: "1F0D6", suit: "clubs", rank: "6"},
  #                {name: "Seven of Clubs", pile_id: @pile.id, unicode_value: "1F0D7", suit: "clubs", rank: "7"},
  #                {name: "Eight of Clubs", pile_id: @pile.id, unicode_value: "1F0D8", suit: "clubs", rank: "8"},
  #                {name: "Nine of Clubs", pile_id: @pile.id, unicode_value: "1F0D9", suit: "clubs", rank: "9"},
  #                {name: "Ten of Clubs", pile_id: @pile.id, unicode_value: "1F0DA", suit: "clubs", rank: "10"},
  #                {name: "Jack of Clubs", pile_id: @pile.id, unicode_value: "1F0DB", suit: "clubs", rank: "J"},
  #                {name: "Queen of Clubs", pile_id: @pile.id, unicode_value: "1F0DD", suit: "clubs", rank: "Q"},
  #                {name: "King of Clubs", pile_id: @pile.id, unicode_value: "1F0DE", suit: "clubs", rank: "K"},
  #                {name: "Ace of Diamonds", pile_id: @pile.id, unicode_value: "1F0C1", suit: "diams", rank: "A"},
  #                {name: "Two of Diamonds", pile_id: @pile.id, unicode_value: "1F0C2", suit: "diams", rank: "2"},
  #                {name: "Three of Diamonds", pile_id: @pile.id, unicode_value: "1F0C3", suit: "diams", rank: "3"},
  #                {name: "Four of Diamonds", pile_id: @pile.id, unicode_value: "1F0C4", suit: "diams", rank: "4"},
  #                {name: "Five of Diamonds", pile_id: @pile.id, unicode_value: "1F0C5", suit: "diams", rank: "5"},
  #                {name: "Six of Diamonds", pile_id: @pile.id, unicode_value: "1F0C6", suit: "diams", rank: "6"},
  #                {name: "Seven of Diamonds", pile_id: @pile.id, unicode_value: "1F0C7", suit: "diams", rank: "7"},
  #                {name: "Eight of Diamonds", pile_id: @pile.id, unicode_value: "1F0C8", suit: "diams", rank: "8"},
  #                {name: "Nine of Diamonds", pile_id: @pile.id, unicode_value: "1F0C9", suit: "diams", rank: "9"},
  #                {name: "Ten of Diamonds", pile_id: @pile.id, unicode_value: "1F0CA", suit: "diams", rank: "10"},
  #                {name: "Jack of Diamonds", pile_id: @pile.id, unicode_value: "1F0CB", suit: "diams", rank: "J"},
  #                {name: "Queen of Diamonds", pile_id: @pile.id, unicode_value: "1F0CD", suit: "diams", rank: "Q"},
  #                {name: "King of Diamonds", pile_id: @pile.id, unicode_value: "1F0CE", suit: "diams", rank: "K"}
  #               ])
  #   room.save!
  #
  #   # flash[:notice] = "Another deck added to the room"
  #   redirect_to room_path({:id => params[:room_id]}), flash: { notice: "Another deck added to the room"} and return
  # end

  def create
    #room_id = params[:room_id]
    room = Room.find_by(id: params[:room_id])
    private_pile = params[:private_pile]
    #name = params[:pile][:name]
    #creator = params[:pile][:creator]
    @pile = Pile.create!(name: params[:pile][:name], creator: params[:pile][:creator], private_pile: private_pile, card_count: 0, room_id: params[:room_id])
    room.piles << @pile
    room.save!
    redirect_to room_path({:id => params[:room_id]}), flash: { notice: "#{@pile.name} was successfully created."}
    #flash[:notice] = "#{@pile.name} was successfully created." #@pile.name
    # redirect_to room_path({:id => room_id}) and return
  end

  def show_pile
    #source_pile = Pile.find_by(name: params[:pile][:source_pile], room_id: params[:room_id])
    source_pile = Pile.find_by(id: params[:source_pile_id])
    if source_pile.nil?
      redirect_to room_path({:id => params[:room_id]}), flash: { notice: 'This is not a pile in the database. Please try again.'} and return
    end
    @is_private = source_pile.private_pile
    @cards = source_pile.cards
    @source_pile = source_pile
    render(partial: 'partials/transfer_cards') if request.xhr?
  end

  def draw_cards_from_deck
    num_cards = params[:pile][:num_cards].to_i
    deck = Pile.find_by(name: "Deck", room_id: params[:room_id])
    destination_pile = Pile.find_by(name: "#{@current_user.user_id}'s Hand", room_id: params[:room_id]) #this represents the format an automatically created hand should get

    if num_cards > deck.cards.count
      redirect_to room_path({:id => params[:room_id]}), flash: { notice: 'There are not enough cards in the deck. Please try again or wait until the deck is replenished.'} and return
    end

    deck_count = deck.cards.count
    list_of_cards = (0...deck_count-1).to_a.sample(num_cards)
    list_of_cards.each do |card_num|
      destination_pile.cards << deck.cards[card_num]
      destination_pile[:card_count] = destination_pile[:card_count] + 1
      deck[:card_count] = deck[:card_count] - 1
      deck.save
      destination_pile.save
    end
    redirect_to room_path({:id => params[:room_id]}), flash: { notice: "#{num_cards} card(s) transferred from Deck!"} and return
  end

  def get_from_draw
    @room = Room.find_by(id: params[:room_id])
    render(partial: 'partials/draw_card') if request.xhr?
  end

  def discard
    @player_pile = Pile.find_by(name: "#{@current_user.user_id}'s Hand", room_id: params[:room_id])
    @thecards = @player_pile.cards
    render(partial: 'partials/discard_cardy') if request.xhr? and return
  end

  def transfer_card
    source_pile = Pile.find_by(name: params[:source_pile_name], room_id: params[:room_id])
    @destination_pile = Pile.find_by(name: params[:pile][:name2], room_id: params[:room_id])
    if @destination_pile.nil?
      redirect_to room_path({:id => params[:room_id]}), flash: { notice: "(transfer_card) This is not a pile in the database. Please try again."} and return #piles_pile_homepage_path and return
    end
    if params[:the_cards].nil?
      redirect_to room_path({:id => params[:room_id]}), flash: { notice: "No cards selected"} and return
    end
    card_difference = params[:the_cards].keys.count
    @destination_pile[:card_count] = @destination_pile.cards.count + card_difference
    source_pile[:card_count] = source_pile.cards.count - card_difference
    @destination_pile.save
    source_pile.save
    params[:the_cards].keys.each do |card|
      @destination_pile.cards << Card.find_by(id: card)
    end
    redirect_to room_path({:id => params[:room_id]}), flash: { notice: "Card(s) successfully transferred!"}
  end

end
