class CoursesController < ApplicationController
  skip_before_filter :require_course_membership, :only => [:new, :create, :join, :teach]
  
  def new
    if @current_user.role == 'student'
      redirect_to root_path, notice: "Unauthorized"
      return
    end
    
    @course = Course.new
  end
  
  def create
    if @current_user.role == 'student'
      redirect_to root_path, notice: "Unauthorized"
      return
    end
    
    @course = Course.new(course_params)
    @course.teacher_id = @current_user.id
    
    if @course.save
      @current_user.update_attribute(:course_id, @course.id)
      redirect_to root_path, notice: "Course created"
    else
      render action: 'new'
    end
  end
  
  def update
    @course = Course.new(course_params)
    
    if @course.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up, #{@user.first_name}."
    else
      flash[:error] = @user.errors.full_messages.first
      render "new"
    end
  end
  
  def join
    @courses_without_teachers = Course.where(teacher_id: nil)
  end
  
  def teach
    if @current_user.role == 'student'
      redirect_to root_path, notice: "Unauthorized"
      return
    end
    
    if @current_user.taught_course
      @current_user.taught_course.update_attribute(:teacher_id, nil)
    end
    
    course = Course.find(params[:id])
    @current_user.update_attribute(:course_id, course.id)
    course.teacher = @current_user
    
    if course.save
      redirect_to root_path, notice: "You are now teaching #{course.title}"
    else
      redirect_to root_path, alert: "Error adding course"
    end
  end
  
  def remove_student
    student = User.find(params[:id])
    student.update_attribute(:course_id, nil)
    
    redirect_to :back, alert: 'Student removed from course'
  end
  
  private
  
  def course_params
    params.require(:course).permit(:title)
  end
end
