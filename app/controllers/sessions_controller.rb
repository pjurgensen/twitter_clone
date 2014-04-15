class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_handle(params[:handle])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in!"
      redirect_to user_path(current_user)
    else
      flash.now.alert = "Email or Password is invalid."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end

end
