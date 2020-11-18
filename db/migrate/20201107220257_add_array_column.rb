class AddArrayColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :piles, :cards_array, :integer, array: true, default: []
  end
end
