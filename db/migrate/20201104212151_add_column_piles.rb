class AddColumnPiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :piles, :cards
    add_column :piles, :cards, :JSON
  end
end
