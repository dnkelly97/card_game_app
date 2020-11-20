class AddCardReference < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :pile
  end
end
