class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    if !@current_user.is_teacher?
      redirect_to root_path, notice: 'Not authorized'
    end

    @announcements = Announcement.where(course_id: @current_user.taught_course.id)
    @latest_announcement = Announcement.order("updated_at").last
    
    @time = @latest_announcement.updated_at.to_time if @latest_announcement
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    if !@current_user.is_teacher?
      redirect_to root_path
    end

    @announcements = Announcement.all
    @latest_announcement = Announcement.order("updated_at").last
    @time = @latest_announcement.updated_at.to_time if @latest_announcement
  end

  # GET /announcements/new
  def new
    if !@current_user.is_teacher?
      redirect_to root_path
    end

    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
    if !@current_user.is_teacher?
      redirect_to root_path
    end
  end

  # POST /announcements
  # POST /announcements.json
  def create
    if !@current_user.is_teacher?
      redirect_to root_path
    end

    @announcement = Announcement.new(announcement_params)
    @announcement.course = @current_user.taught_course

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /announcements/1
  def update
    if !@current_user.is_teacher?
      redirect_to root_path
    end

    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /announcements/1
  def destroy
    if !@current_user.is_teacher?
      redirect_to root_path
    end

    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:created_at, :updated_at, :content)
    end
end
