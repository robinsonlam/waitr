class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find_by id => params[:id]
  end

  def edit
  	@category = Category.find_by id => params[:id]
  end

  def new
  	@category = Category.new
  end
end
