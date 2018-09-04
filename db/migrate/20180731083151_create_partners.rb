class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string   :title, limit: 255, null: false
      t.string   :web_url, limit: 255, default: ""

      t.boolean  :vip, default: false
      t.boolean  :visible, default: false
    end

    add_index :partners, :title, unique: true
    add_index :partners, :vip
    add_index :partners, :visible
  end
end