class CreateShortLists < ActiveRecord::Migration[5.2]
  def change
    create_table :short_lists do |t|
    	t.belongs_to :user
    	t.belongs_to :restaurant
    	t.timestamps
    end
  end
end
