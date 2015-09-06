class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:index, :edit, :update]
  before_action :check_if_admin, :only => [:index]

  def index
  	@users = User.all
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new user_params

  	if @user.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end
end
