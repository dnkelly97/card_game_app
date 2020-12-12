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
