class RemovePrivateColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :piles, :private
  end
end
