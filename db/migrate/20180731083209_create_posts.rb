class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string   :title, limit: 255, null: false
      t.text     :description, limit: 5000

      t.boolean  :visible, default: false

      t.timestamps
    end

    add_index :posts, :title, unique: true
    add_index :posts, :visible
  end
end