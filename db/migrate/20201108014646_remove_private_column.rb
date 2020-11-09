class RemovePrivateColumn < ActiveRecord::Migration
  def change
    remove_column :piles, :private
  end
end
