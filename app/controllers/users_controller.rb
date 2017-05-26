class UsersController < ApplicationController
  before_action :check_logged_in_user, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def check_logged_in_user
    if session[:user_id].nil?
      redirect_to root_path
    end
  end

end
