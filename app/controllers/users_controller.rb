class UsersController < ApplicationController
    before_action :get_user, only: [:edit, :update]
    def new 
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User created"
            redirect_to myfood_login_path
        else 
            flash[:danger] = "User not created"
            render "new"
        end
    end
    def edit  
    end
    def update
        if @user.update(user_params)
            flash[:success] = "user updated"
            redirect_to user_path
        else 
            flash[:danger] = "not updated"
            render "edit"
        end
    end
    private
    def user_params
        params.require(:user).permit(:user_name, :email, :password, :password_confirm)
    end
    def get_user
        user = User.find_by(params[:id])
    end
end
