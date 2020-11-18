class AddCardsColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :piles, :cards, :integer, array: true, default: []
  end
end
