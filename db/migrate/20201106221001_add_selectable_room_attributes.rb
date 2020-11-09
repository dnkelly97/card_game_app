class AddSelectableRoomAttributes < ActiveRecord::Migration
  def change
    add_column :rooms, :max_players, :integer
    add_column :rooms, :game_type, :string
    add_column :rooms, :private, :boolean
  end
end
