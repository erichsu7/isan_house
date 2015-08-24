class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1, null: false
      t.string :line2
      t.string :city, null: false
      t.string :state, null: false, limit: 2
      t.integer :zip, null: false
      t.integer :addressable_id, null: false
      t.string :addressable_type, null: false

      t.timestamps null: false
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
