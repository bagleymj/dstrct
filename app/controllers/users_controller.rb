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

  def show
    @user = User.find(params[:id])
    @title = @user.username
  end

  def user_params
    params.require(:user).permit(:username, :password, :score, :post_count)
  end
end
