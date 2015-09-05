class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.text :name
    	t.float :price
    	t.text :image
    end
  end
end
