class SessionsController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :require_course_membership
  
  def create
    user = User.find_by_username(params[:username])
        
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      redirect_to root_path
    else      
      flash.now.alert = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Successfully logged out!"
  end
end
