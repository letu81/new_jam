class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
        t.integer :user_id   
    	t.string :username,              null: false, default: ""
        t.string :address,               null: false, default: ""
        t.string :mobile,                null: false, default: ""
        t.string :post_code,             null: false, default: ""

        t.boolean :is_default,           default: false
        t.boolean :disable,              default: false

        t.timestamps null: false
    end

    add_index :addresses, :user_id
    add_index :addresses, :mobile
    add_index :addresses, :post_code
    add_index :addresses, :disable
    add_index :addresses, [:user_id, :is_default]
    add_index :addresses, [:user_id, :disable]
  end
end