class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, limit: 30, null: false
      t.string :password_digest, null: false
      t.string :auth_token, null: false

      t.timestamps
    end
    add_index :users, :auth_token, unique: true
    add_index :users, :username, unique: true
  end
end
