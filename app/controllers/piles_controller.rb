class PilesController < ApplicationController
  def pile_params
    params.require(:pile).permit(:name, :private_pile, :creator)
  end
  def index
    @piles = Pile.all
  end

  def new

  end

  def create
    private_pile = params[:private_pile]
    name = params[:pile][:name]
    creator = params[:pile][:creator]
    @pile = Pile.create!(name: name, creator: creator, private_pile: private_pile )
    flash[:notice] = "#{@pile.serializable_hash} was successfully created." #@pile.name
    redirect_to piles_path
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
  end

  def transfer_card
    destination_pile = params[:pile][:name2]
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
