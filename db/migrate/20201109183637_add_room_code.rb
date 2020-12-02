class AddRoomCode < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :room_code, :string
    add_index :rooms, :room_code, unique: true
    remove_index :rooms, name: "index_rooms_on_name"
  end
end
