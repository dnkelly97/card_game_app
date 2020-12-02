class CreatePiles < ActiveRecord::Migration[5.2]
  def change
    create_table :piles do |t|
      t.string 'name'
      t.boolean 'private'
      t.string 'creator'
      t.text :cards, default: [].to_yaml
    end
  end
end

#we need to make it so name correctly updates
# also need to remove :cards attribute
# maybe add a t.integer number_of_cards attribute