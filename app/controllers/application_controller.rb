class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :require_login, :except => [:users]
  before_filter :require_course_membership

  Time.zone = "Pacific Time (US & Canada)"

  private
  
  def require_login
    unless current_user
      redirect_to log_in_path
    end
  end
  
  def require_course_membership
    if current_user
      if current_user.course.nil?
        redirect_to join_course_path
      end
    end
  end
  
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]

#    if session[:user_id]
#      @current_user ||= User.find(session[:user_id])
#    end
  end
  
  helper_method :current_user
end
