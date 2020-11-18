class RemoveCardsArray < ActiveRecord::Migration[4.2]
  def change
    remove_column :piles, :cards_array
  end
end
