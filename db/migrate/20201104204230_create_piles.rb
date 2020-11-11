class CreatePiles < ActiveRecord::Migration
  def change
    create_table :piles do |t|
      t.string 'name'
      t.boolean 'private'
      t.string 'creator'
      t.text :cards, array: true, default: []
    end
  end
end

#we need to make it so name correctly updates
# also need to remove :cards attribute
# maybe add a t.integer number_of_cards attribute