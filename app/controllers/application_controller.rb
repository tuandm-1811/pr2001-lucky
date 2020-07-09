# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    User.first || User.create!(user_name: 'bach', email: 'tvb@gmail.com', password: '12', password_confirmation: '12')
  end
end
