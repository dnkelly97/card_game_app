class AddRoomCodeColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :rooms, :room_code, :string
  end
end
