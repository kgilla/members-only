class PostsController < ApplicationController
  # before_action :logged_in_user, only: [:create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_data)
    if @post.save
      flash[:success] = "Post Created."
      redirect_to root_url
    else
      flash[:danger] = 'You made a mistake somewhere...'
      render 'new'
    end
  end
    
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private

  def post_data
    params.require(:post).permit(:title, :body) 
  end
end
