class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
    	t.text :name
    	t.float :price
    	t.text :image
    end
  end
end
