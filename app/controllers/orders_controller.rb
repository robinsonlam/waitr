class OrdersController < ApplicationController
	before_action :calculate_total, :only => [:show, :update]
  before_action :check_if_logged_in, :only => [:show]
  before_action :check_if_owner, :only => [:show]
  before_action :check_if_admin, :only => [:index]
  def index
  	@orders = Order.order :progress

    @orders.each do |order|
      total = 0
      order.items.each do |item|
        total += item.price
      end
      order.update :total => total
    end
  end

  def new
  	@order = Order.new
  	@items = Item.all
  end

  def create
  	order = Order.create(:user_id => @current_user.id, :item_ids => params[:order][:item_ids])
    
    total = 0
    order.items.each do |item|
      total += item.price
    end
    order.update :total => total

    redirect_to order_path(order)
  end

  def show
  	@order = Order.find_by :id => params[:id]
  end

  def update
    order = Order.find_by :id => params[:id]
    order.update(:progress => params[:order][:progress])
    redirect_to orders_path
  end

  def edit
  end

  def destroy
    order = Order.find_by :id => params[:id]
    order.destroy
    redirect_to orders_path
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

  def check_if_owner
    order = Order.find_by :id => params[:id]
    redirect_to root_path unless @current_user.id == order.user_id
  end
end
