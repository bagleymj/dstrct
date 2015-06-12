class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      #Log In
      log_in user
      redirect_to posts_path
    else
      #Fail
      flash.now[:danger] = "Incorrect username/password combination"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "User successfully logged out!" 
    redirect_to posts_path
  end
end
