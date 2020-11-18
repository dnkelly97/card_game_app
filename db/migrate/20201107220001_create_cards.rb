class CreateCards < ActiveRecord::Migration[4.2]
  def change
    create_table :cards do |t|
      t.string 'name'
    end
  end
end
