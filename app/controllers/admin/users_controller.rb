# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'User created successfuly'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
   end

  def update
    @user = User.find(params[:id])
    if user.update(user_params)
      flash[:success] = 'update successfuly'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password_digest, :birth, :sex
  end
end
