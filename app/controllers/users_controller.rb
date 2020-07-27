# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def new
    @user = User.new
  end
  def show 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'User created'
      redirect_to 
    else
      flash[:danger] = 'User not created'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'user updated'
      redirect_to user_path
    else
      flash[:danger] = 'not updated'
      render 'edit'
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirm)
  end

  def get_user
    user = User.find_by(params[:id])
  end
end
