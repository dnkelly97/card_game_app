class AddSuitAndRankToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :suit, :string
    add_column :cards, :rank, :string
    Card.all.each do |card|
      if card.suit.nil?
        if card.name.split[2] == "Diamonds" then card.suit = "diams" else card.suit = card.name.split[2].downcase end
        card.save
      end
      if card.rank.nil?
        case card.name.split[0]
        when "Ace"
          card.rank = "A"
        when "Two"
          card.rank = "2"
        when "Three"
          card.rank = "3"
        when "Four"
          card.rank = "4"
        when "Five"
          card.rank = "5"
        when "Six"
          card.rank = "6"
        when "Seven"
          card.rank = "7"
        when "Eight"
          card.rank = "8"
        when "Nine"
          card.rank = "9"
        when "Ten"
          card.rank = "10"
        when "Jack"
          card.rank = "J"
        when "Queen"
          card.rank = "Q"
        when "King"
          card.rank = "K"
        else
          nil
        end
        card.save
      end
    end
  end
end
