class AddCardsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :piles, :cards
    add_column :piles, :cards, :integer, default: [].to_yaml
  end
end
