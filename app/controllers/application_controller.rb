class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def require_login
    redirect_to root_path unless signed_in?
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first.presence if session[:user_id].present?
  end

  def signed_in?
    current_user.present?
  end
end
