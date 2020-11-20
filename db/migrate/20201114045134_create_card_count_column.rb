class CreateCardCountColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :piles, :card_count, :integer
  end
end

