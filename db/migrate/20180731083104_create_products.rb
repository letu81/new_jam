class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   :title, limit: 255, null: false

      t.string   :intro, limit: 255, default: ""
      t.string   :keywords, limit: 255, default: ""
      t.text     :description, limit: 5000

      t.string   :images
      
      t.boolean  :visible, default: false

      t.timestamps
    end

    add_index :products, :title, unique: true
    add_index :products, :intro
    add_index :products, :visible
  end
end