class AddCardsColumnUnicodeValue < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :unicode_value, :string
  end
end
