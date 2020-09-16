class PostsController < ApplicationController
  layout "logged_in"

  before_action :current_user
  before_action :current_post, only: [:show, :edit, :update, :destroy]

  def index

    if !params["user_id"] && !params["genre_id"]
      @posts = Post.all
    elsif !params["genre_id"]
      @posts = @user.posts
    else
      @posts = Genre.find(params["genre_id"]).posts
    end 

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    render :layout => 'logged_in_show'
  end

  def edit
    if !check_users_post?
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else 
      render :edit
    end 
  end

  def destroy
    if check_users_post?
      @post.destroy
      redirect_to posts_path
    end
  end

  def user_posts
    @posts = @user.posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :genre_id, :url)
  end 

end
