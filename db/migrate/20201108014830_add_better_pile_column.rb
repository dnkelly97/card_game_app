class AddBetterPileColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :piles, :private_pile, :boolean
  end
end
