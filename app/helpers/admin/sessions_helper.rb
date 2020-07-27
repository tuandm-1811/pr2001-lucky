# frozen_string_literal: true

module Admin::SessionsHelper
  def log_in(user)
    session[:current_admin_id] = user.id
  end

  def current_admin # Returns the current logged-in user (if any).
    @current_admin ||= User.find_by(id: session[:current_admin_id]) if session[:current_admin_id]
  end

  def admin_logged_in? # Returns true if the user is logged in
    !current_admin.nil?
  end

  def log_out
    session.delete(:current_admin_id)
    @current_admin = nil
  end
end
