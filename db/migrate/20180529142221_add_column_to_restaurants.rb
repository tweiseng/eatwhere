class AddColumnToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	add_column :restaurants, :place_id, :string
  end
end
