class CreateDynamics < ActiveRecord::Migration[5.2]
  def change
    create_table :dynamics do |t|
      t.string   :title, limit: 255, null: false
      t.string   :web_url, limit: 255, null: false
      t.text     :description, limit: 5000

      t.boolean  :visible, default: false

      t.timestamps
    end

    add_index :dynamics, :title, unique: true
    add_index :dynamics, :visible
  end
end