class AddCardReference < ActiveRecord::Migration
  def change
    add_reference :cards, :pile
  end
end
