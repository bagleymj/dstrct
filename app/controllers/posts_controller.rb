class PostsController < ApplicationController
  def index
    user = current_user
    @post = user.posts.new
    @title = "Posts"
    users = User.all
    posts = []
    users.each do |user|
      post_query = user.posts.where('destruct_at > ?', Time.now)
      if !post_query.empty?
        posts << post_query.last
      end
    end
    @posts = posts.sort_by {|post| post[:created_at] }.reverse
  end
  
#  def new
#    @title = "Write new post"
#    user = current_user
#    @post = user.posts.new
#  end
  
  def create
    user = current_user
    last_post = user.posts.last
    if last_post.is_not_destructed?
      last_post.lifespan = (last_post.destruct_at - (last_post.destruct_at - Time.now)).to_i
      last_post.save
    end
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
    params.require(:post).permit(:title, :content, :score, :lifespan)
  end

  def vote_up
    @post = Post.find_by_id(params[:id])
    @user = @post.user
    @user.score += 1
    @post.score += 1
    if @user.save && @post.save
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
    @post.score += -1
    @user.score += -1
    if @user.save && @post.save
      flash[:success] = "Score DOWNgraded"
      redirect_to posts_path
    else
      flash[:danger] = "Something went wrong"
      redirect_to posts_path
    end
  end


end
