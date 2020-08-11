class PasswordResetsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email: params[:password_reset][:email].downcase)
            if @user
            @user.created_at_before_last_save
            # tra ve gia tri goc trc khi save
            flash[:success] = "Email sent with password reset instructions"
            redirect_to root_url
        else
            flash.now[:danger] = "Email address not found"
            render 'new'
        end
    end
    def edit
    end
end