class AddColumnsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :province_id, :integer
    add_column :addresses, :city_id, :integer
    add_column :addresses, :district_id, :integer

  	add_index :addresses, [:province_id, :city_id, :district_id], using: :btree
  end
end