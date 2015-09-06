class OrdersController < ApplicationController
	before_action :calculate_total, :except => [:index]
  
  def index
  	@orders = Order.all
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
