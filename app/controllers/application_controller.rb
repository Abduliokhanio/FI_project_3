class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user    
        @user = User.find_by(id: session[:user_id])  
    end

    def current_post
        @post = Post.find(params[:id])
    end 

    def get_all_posts
        @posts = Post.all
    end 

    def logged_in?
        !current_user.nil?
    end 

    def authorized
        redirect_to '/login' unless logged_in?
    end

    def check_users_post?
        current_post.user_id == current_user.id
    end 

    def no_image_user
        if @user.image == nil
            @user.image = "https://ombud.alaska.gov/wp-content/uploads/2018/01/no-user.jpg"
        end
    end 

end
