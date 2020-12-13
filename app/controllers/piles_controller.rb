class PilesController < ApplicationController
  before_action :set_current_user
  protect_from_forgery with: :null_session

  def pile_params
    params.require(:pile).permit(:name, :private_pile, :creator, :source_pile_id, :destination_pile_id)
  end

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
    redirect_to room_path({id: params[:room_id]}), flash: { notice: "#{@pile.name} was successfully created."}
    #flash[:notice] = "#{@pile.name} was successfully created." #@pile.name
    # redirect_to room_path({:id => room_id}) and return
  end

  def show_transfer
    @piles = Room.find_by_id(params[:room_id]).piles
    render(partial: 'partials/transfer_cards') if request.xhr?
  end

  def draw_cards_from_deck
    num_cards = params[:pile][:num_cards].to_i
    deck = Pile.find_by(name: "Deck", room_id: params[:room_id])
    destination_pile = Pile.find_by(name: "#{@current_user.user_id}'s Hand", room_id: params[:room_id]) #this represents the format an automatically created hand should get
    if num_cards > deck.cards.count
      redirect_to room_path({id: params[:room_id]}), flash: { notice: 'There are not enough cards in the deck. Please try again or wait until the deck is replenished.'} and return
    end
    deck_count = deck.cards.count
    list_of_cards = (0...deck_count-1).to_a.sample(num_cards)
    list_of_cards.each do |card_num|
      destination_pile.cards << deck.cards[card_num]
    end
    destination_pile[:card_count] = destination_pile[:card_count] + num_cards
    deck[:card_count] = deck[:card_count] - num_cards
    deck.save
    destination_pile.save
    redirect_to room_path({id: params[:room_id]}), flash: { notice: "#{num_cards} card(s) transferred from Deck!"} and
        return unless request.xhr?

    # https://stackoverflow.com/questions/4632271/render-nothing-true-returns-empty-plaintext-file/18059789
    render plain: 'drawn', status: 200, content_type: 'text/html' if request.xhr?

  end

  def transfer_card
    begin
      source_pile = Pile.find pile_params[:source_pile_id]
      destination_pile = Pile.find pile_params[:destination_pile_id]
    rescue ActiveRecord::RecordNotFound
      redirect_to room_path({id: params[:room_id]}) and return
    end
    if params[:the_cards].nil?
      redirect_to room_path({id: params[:room_id]}) and return
    end
    Pile.transfer(source_pile, destination_pile, params[:the_cards])
  end

  def get_from_draw
    @room = Room.find_by(id: params[:room_id])
    render(partial: 'partials/draw_card') if request.xhr?
  end

  def discard
    @player_pile = Pile.find_by(name: "#{@current_user.user_id}'s Hand", room_id: params[:room_id])
    @thecards = @player_pile.cards
    render(partial: 'partials/discard_cardy') if request.xhr?
  end

  def transfer_to_discard
    source_pile = Pile.find_by(name: params[:source_pile_name], room_id: params[:room_id])
    @destination_pile = Pile.find_by(name: params[:pile][:name2], room_id: params[:room_id])
    if @destination_pile.nil?
      redirect_to room_path({id: params[:room_id]}), flash: { notice: "(transfer_card) This is not a pile in the database. Please try again."} and return #piles_pile_homepage_path and return
    end
    if params[:the_cards].nil?
      redirect_to room_path({id: params[:room_id]}), flash: { notice: "No cards selected"} and return
    end
    Pile.transfer source_pile, @destination_pile, params[:the_cards]
    redirect_to room_path({id: params[:room_id]}), flash: { notice: "Card(s) successfully discarded!"}
  end

end
