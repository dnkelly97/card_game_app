class AddColumnPiles < ActiveRecord::Migration
  def change
    remove_column :piles, :cards
    add_column :piles, :cards, :JSON
  end
end
