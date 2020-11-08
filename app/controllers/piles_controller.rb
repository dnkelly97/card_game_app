class PilesController < ApplicationController
  def pile_params
    params.require(:pile).permit(:name, :private, :creator)
  end
  def index
    @piles = Pile.all
  end

  def new

  end

  def create
    @pile = Pile.create!(pile_params)
    flash[:notice] = "#{@pile.name} was successfully created."
    redirect_to piles_path
  end

  def show
    source_pile = params[:pile][:source_pile]
    source_pile = Pile.find_by(name: source_pile)
    @is_private = source_pile.private_pile
    @cards = source_pile.cards
  end

  def transfer_card
    destination_pile = params[:pile][:name2]
    @destination_pile = Pile.find_by(name: destination_pile)
    if params[:the_cards].nil?
      flash[:notice] = "No cards selected"
      redirect_to piles_path and return
    end
    params[:the_cards].keys.each do |card|
      flash[:notice] = "#{card}"
      @destination_pile.cards << Card.find_by(name: card)
    end
    flash[:notice] = "Card(s) successfully transferred!"
    redirect_to piles_path
  end

  def pile_homepage
    @pile_list = Pile.all
  end
end
