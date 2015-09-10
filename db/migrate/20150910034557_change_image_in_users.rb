class ChangeImageInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :image, :text, :default => 'http://www.gravatar.com/avatar/?d=mm'
  end
end
