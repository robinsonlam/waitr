class OrdersController < ApplicationController
	# before_action :calculate_total, :except => [:index, :new]
  
  def index
  	@orders = Order.all
  end

  def new
  	@order = Order.new
  	@items = Item.all
  end

  def create
  	order = Order.create(:user_id => @current_user.id, :item_ids => params[:order][:item_ids])
  	redirect_to order_path(order)
  end

  def show
  	@order = Order.find_by :id => params[:id]
  end

  def edit
  end

  private
  def calculate_total
  	order = Order.find_by :id => params[:id]
  	total = 0
  	order.items.each do |item|
  		total += item.price
  	end
  	order.update :total => total
  end
end
