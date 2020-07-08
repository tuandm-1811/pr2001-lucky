# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :check_admin
  # layout "admin/admin_new"
  def index
    @products = Product.all # all = find(:all)
    @users = User.all
  end
  # private
  # def check_admin
  #     unless current_user.admin?
  #         redirect_to root_path, :alert => 'You cant login this page !'
  #     end
  # end
end
