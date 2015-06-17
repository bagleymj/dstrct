class PostsController < ApplicationController
  def index
    @title = "Posts"
    users = User.all
    posts = []
    users.each do |user|
      if !user.posts.empty?
        posts << user.posts.last
      end
    end
    @posts = posts.sort_by {|post| post[:created_at] }.reverse
  end
  
  def new
    @title = "Write new post"
    user = current_user
    @post = user.posts.new
  end
  
  def create
    user = current_user
    @post =user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post submitted"
      user.post_count = user.post_count + 1
      redirect_to posts_path
    else
      render :new
    end

  end
  
  def show

  end
  
  def edit
 
  end
  
  def update

  end
  
  def delete

  end
  
  def destroy

  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def vote_up
    @post = Post.find_by_id(params[:id])
    @user = @post.user
    @user.score = @user.score + 1
    if @user.save
      flash[:success] = "Score UPdated"
      redirect_to posts_path
    else
      flash[:danger] = "Something went wrong"
      redirect_to posts_path
    end
  end
  def vote_down
    @post = Post.find_by_id(params[:id])
    @user = @post.user
    @user.score = @user.score - 1
    if @user.save
      flash[:success] = "Score DOWNgraded"
      @posts = Post.all
      render :index
    else
      flash[:danger] = "Something went wrong"
      @posts = Post.all
      render :index
    end
  end


end
