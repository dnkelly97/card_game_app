class AddRoomCodeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :room_code, :string
  end
end
