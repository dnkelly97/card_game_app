class RemoveCardsArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :piles, :cards_array
  end
end
