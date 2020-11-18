class AddBetterPileColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :piles, :private_pile, :boolean
  end
end
