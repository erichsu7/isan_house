class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.boolean :is_admin, null: false, default: false
      t.date :birthdate
      t.integer :address_id
      t.string :phone_number, limit: 10

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
  end
end
