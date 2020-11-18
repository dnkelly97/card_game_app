class AddRoomCodeFix < ActiveRecord::Migration[4.2]
  def change
    add_index :rooms, :room_code, unique: true
    remove_index :rooms, name: "index_rooms_on_name"
  end
end
