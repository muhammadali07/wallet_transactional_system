# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  # Helper method to get current user from session
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
