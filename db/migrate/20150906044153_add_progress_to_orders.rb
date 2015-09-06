class AddProgressToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :progress, :text, :default => "Processing"
  end
end
