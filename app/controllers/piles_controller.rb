class PilesController < ApplicationController
  before_action :set_current_user
  def pile_params
    params.require(:pile).permit(:name, :private_pile, :creator)
  end
  def index
    @piles = Pile.all
  end

  def new

  end
  def new_deck

  end
  def create_deck
    room_id = params[:room_id]
    room = Room.find_by(id: room_id)
    @pile = Pile.create!(name: "Deck", creator: "The Game", private_pile: true, card_count: 52, room_id: room_id)
    room.piles << @pile
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
    room.save!

    flash[:notice] = "Game deck initialized!" #@pile.name
    redirect_to room_path({:id => room_id}) and return
  end

  def create
    room_id = params[:room_id]
    room = Room.find_by(id: room_id)
    private_pile = params[:private_pile]
    name = params[:pile][:name]
    creator = params[:pile][:creator]
    if @current_user.nil?
      flash[:notice] = "@current_user is still nil" #@pile.name
      redirect_to room_path({:id => room_id}) and return
    end
    @pile = Pile.create!(name: name, creator: creator, private_pile: private_pile, card_count: 0, room_id: room_id)
    room.piles << @pile
    room.save!
    flash[:notice] = "#{@pile.serializable_hash} was successfully created. room id is#{room_id}" #@pile.name
    redirect_to room_path({:id => room_id}) and return
  end

  def show
    source_pile = params[:pile][:source_pile]
    source_pile = Pile.find_by(name: source_pile)
    room_id = params[:room_id]
    if source_pile.nil?
      flash[:notice] = "This is not a pile in the database. Please try again." #@pile.name
      redirect_to room_path({:id => room_id}) and return
    end
    @is_private = source_pile.private_pile
    @cards = source_pile.cards
    @source_pile = source_pile
  end

  def transfer_card
    destination_pile = params[:pile][:name2]
    source_pile = Pile.find_by(name: params[:source_pile_name])
    room_id = params[:room_id]
    @destination_pile = Pile.find_by(name: destination_pile)
    if @destination_pile.nil?
      flash[:notice] = "This is not a pile in the database. Please try again." #@pile.name
      redirect_to room_path({:id => room_id}) and return #piles_pile_homepage_path and return
    end
    if params[:the_cards].nil?
      flash[:notice] = "No cards selected"
      redirect_to room_path({:id => room_id}) and return
    end
    card_difference = params[:the_cards].keys.count
    @destination_pile[:card_count] = @destination_pile.cards.count + card_difference
    source_pile[:card_count] = source_pile.cards.count - card_difference
    @destination_pile.save
    source_pile.save
    params[:the_cards].keys.each do |card|
      flash[:notice] = "#{card}"
      @destination_pile.cards << Card.find_by(name: card)
    end
    flash[:notice] = "Card(s) successfully transferred!"
    redirect_to room_path({:id => room_id})
  end

  def pile_homepage
    @pile_list = Pile.all
  end
end
