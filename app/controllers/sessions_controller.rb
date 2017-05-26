class SessionsController < ApplicationController

  def new
  end

  def login
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/'
    end
  end

    def destroy
      session.destroy
      redirect_to '/'
    end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
