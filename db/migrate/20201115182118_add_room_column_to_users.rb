class AddRoomColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :room
  end
end
