class CreateItemsUsers < ActiveRecord::Migration
  def change
    create_table :items_users, :id => false do |t|
    	t.integer :item_id
      t.integer :user_id
    end
  end
end
