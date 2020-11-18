class RemovePrivateColumn < ActiveRecord::Migration[4.2]
  def change
    remove_column :piles, :private
  end
end
