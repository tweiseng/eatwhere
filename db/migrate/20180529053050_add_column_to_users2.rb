class AddColumnToUsers2 < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :confirmation_token, :string, :limit=>128
  	add_column :users, :remember_token, :string, :limit=>128
  end
end
