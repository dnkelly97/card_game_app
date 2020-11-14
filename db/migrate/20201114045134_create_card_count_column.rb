class CreateCardCountColumn < ActiveRecord::Migration
  def change
    add_column :piles, :card_count, :integer
  end
end

