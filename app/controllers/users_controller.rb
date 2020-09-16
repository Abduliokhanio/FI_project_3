class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    render :layout => 'signup_login'
  end

  def create
    @user = User.new(user_params)
    no_image_user
    if @user.save
      session[:user_id] = @user.id
      redirect_to login_path
    else
      render :new, :layout => 'signup_login'
    end   
  end

  def edit
    current_user
    render :layout => 'logged_in'
  end

  def update
    current_user
    if @user.update(user_params)
      redirect_to posts_path
    else 
      render :edit, :layout => 'logged_in'
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:username, :password, :image, :website, :location, :bio)
  end 

end
