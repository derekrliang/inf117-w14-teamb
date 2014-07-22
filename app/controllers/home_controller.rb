class HomeController < ApplicationController
  def show
    @response = Response.response_for_revision_by_user(@current_user)
    @latest_announcement = Announcement.where(course_id: @current_user.course.id).order("updated_at").last
    
    @time = @latest_announcement.updated_at.to_time if @latest_announcement
  end

  def admin
    if @current_user.role != "teacher"
      redirect_to root_path
    end
  end
end