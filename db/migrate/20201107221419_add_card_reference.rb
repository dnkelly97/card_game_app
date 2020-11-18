class AddCardReference < ActiveRecord::Migration[4.2]
  def change
    add_reference :cards, :pile
  end
end
