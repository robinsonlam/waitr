class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.text :email
    	t.text :first_name
    	t.text :last_name
    	t.text :image
    	t.text :password_digest
    end
  end
end
