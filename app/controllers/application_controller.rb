require 'digest/md5'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(email: session[:email])
  end

  def require_user
    redirect_to new_session_path unless current_user
  end
end
