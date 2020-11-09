class AddArrayColumn < ActiveRecord::Migration
  def change
    add_column :piles, :cards_array, :integer, array: true, default: []
  end
end
