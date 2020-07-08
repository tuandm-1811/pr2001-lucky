module Admin::SessionsHelper
  def log_in(user)
    session(:current_user_id) = user.id   # Logs in the given user.
  end
end
