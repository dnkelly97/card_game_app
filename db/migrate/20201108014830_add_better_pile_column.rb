class AddBetterPileColumn < ActiveRecord::Migration
  def change
    add_column :piles, :private_pile, :boolean
  end
end
