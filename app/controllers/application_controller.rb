class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :authenticate_user!
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_admin!
    unless current_user
      redirect_to(new_session_path, notice: "Please login first") 
    else
      redirect_to(new_session_path, notice: "Retricted access, must be an admin") unless current_user.is_admin? 
    end
  end

  def authenticate_user!
  	redirect_to(new_session_path, notice: "Please login first") unless current_user 
  end
end
