class AddMoreSelectableRoomAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :max_players, :integer
    add_column :rooms, :game_type, :string
    add_column :rooms, :private, :boolean
  end
end
