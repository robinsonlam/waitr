class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update]
  before_action :check_if_correct_user, :only => [:show]
  before_action :check_if_admin, :only => [:index]

  def index
  	@users = User.all
  end

  def show
    @user = @current_user
    @orders = Order.where( :user_id => @user.id ).order( :progress )
  end

  def edit
    @user = @current_user
  end

  def new
    redirect_to root_path if @current_user.present?
  	@user = User.new
  end

  def create
  	@user = User.new user_params

  	if @user.save
      session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

  def check_if_correct_user
    user = User.find_by :id => params[:id]
    redirect_to root_path unless @current_user.present? && (@current_user.id == user.id || @current_user.admin?)
  end
end
