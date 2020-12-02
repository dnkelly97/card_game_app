class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :password_digest
      t.string :provider
      t.string :session_token
      t.timestamps null: false
    end
  end
end
