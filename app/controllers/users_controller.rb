class UsersController < ApplicationController
  def index
    @title = "User List"
    @users = User.all
  end
  def new
    @title = "Sign up!"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully saved!"
      redirect_to users_path
    else
      @title = "Sign up!"
      render :new
    end
    
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end