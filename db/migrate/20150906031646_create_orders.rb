class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.float :total
    	t.integer :user_id
    end
  end
end
