class CreateCustomizeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :customize_products do |t|
      t.string   :title, limit: 255, null: false

      t.string   :intro, limit: 255, default: ""
      t.string   :keywords, limit: 255, default: ""
      t.text     :description, limit: 5000

      t.string   :images
      
      t.boolean  :visible, default: false

      t.timestamps
    end

    add_index :customize_products, :title, unique: true
    add_index :customize_products, :intro
    add_index :customize_products, :visible
  end
end