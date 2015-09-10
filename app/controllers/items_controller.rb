class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find_by :id => params[:id]
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create item_params
    redirect_to items_path
  end

  def edit
    @item = Item.find_by :id => params[:id]
  end

  def destroy
    item = Item.find_by :id => params[:id]
    item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit( :name, :price )
  end
end
