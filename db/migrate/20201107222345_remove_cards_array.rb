class RemoveCardsArray < ActiveRecord::Migration
  def change
    remove_column :piles, :cards_array
  end
end
