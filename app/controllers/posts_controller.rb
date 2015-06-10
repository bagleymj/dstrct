class PostsController < ApplicationController
  def index
    @title = "Posts"
    @posts = Post.all
  end
  
  def new
    @title = "Write new post"
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post submitted"
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

end
