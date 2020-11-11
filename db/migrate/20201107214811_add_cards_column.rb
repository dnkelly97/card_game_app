class AddCardsColumn < ActiveRecord::Migration
  def change
    add_column :piles, :cards, :integer, array: true, default: []
  end
end
