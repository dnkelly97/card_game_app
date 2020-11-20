class AddRoomIdColumnToPiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :piles, :room
  end
end
