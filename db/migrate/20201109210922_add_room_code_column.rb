class AddRoomCodeColumn < ActiveRecord::Migration
  def change
    add_column :rooms, :room_code, :string
  end
end
