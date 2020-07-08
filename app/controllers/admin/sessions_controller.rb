# frozen_string_literal: true

class Admin::SessionsController < Admin::BaseController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      log_in(user)
      redirect_to admin_categories_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
  end
end
