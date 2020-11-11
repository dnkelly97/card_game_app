class RemoveCardColumn < ActiveRecord::Migration
  def change
    remove_column :piles, :cards
  end
end
