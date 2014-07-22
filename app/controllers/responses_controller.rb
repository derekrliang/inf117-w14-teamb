class ResponsesController < ApplicationController
  def new
    # If the student has an incomplete response that they have navigated away from, delete it before 
    incomplete_responses = Response.incomplete_responses_for_user @current_user
    if incomplete_responses.any?
      incomplete_responses.destroy_all
    end
    
    @response = Response.new
    @response.user = @current_user
    @response.category = Category.find(params[:category_id])
    
    # Randomly assign a question to the response
    @response.question = Question.all.first(offset: rand(Question.all.count))
  
    @response.save(validate: false)
  end

  def update
    @response = Response.find(params[:id])
    
    update_params = response_params
    
    # The parameters for best and worst sentence come as strings as displayed in the dropdown, we need to convert them to numbers to store in the database
    case update_params[:best_sentence]
    when 'Sentence A'
      update_params[:best_sentence] = 1
    when 'Sentence B'
      update_params[:best_sentence] = 2
    when 'Sentence C'
      update_params[:best_sentence] = 3
    end
    
    case update_params[:worst_sentence]
    when 'Sentence A'
      update_params[:worst_sentence] = 1
    when 'Sentence B'
      update_params[:worst_sentence] = 2
    when 'Sentence C'
      update_params[:worst_sentence] = 3
    end
    
    if (@response.reviewer_id == @current_user.id) && (update_params[:worst_sentence_feedback].nil? || update_params[:best_sentence_feedback].nil?)
      flash[:alert] = 'You must enter feedback for the best and worst sentences'
      render action: 'review'
      return
    end
    
    if (@response.reviewer_id == @current_user.id) && (update_params[:worst_sentence] == update_params[:best_sentence])
      flash[:alert] = 'You must select different best and worst sentences'
      render action: 'review'
      return
    end

    if @response.update_attributes(update_params)
      # If the update is caused by a response submission, a review, or a revision, we need to show different messages
      if @response.reviewer_id == @current_user.id
        redirect_to root_path, notice: 'Your review has been sent to the author.'
      elsif @response.completed?
        redirect_to root_path, notice: 'Your response has been submitted to your teacher.'
      else
        redirect_to root_path, notice: 'Your response has been sent to a peer for review.'
      end
    else
      flash[:alert] = 'There was an error saving your response'
      if @response.reviewer_id == @current_user.id
      else
        render action: 'new'
      end
    end
  end
  
  def show
    @response = Response.find(params[:id])
  end
  
  def review
    incomplete_reviews = Response.incomplete_reviews_for_user @current_user
    
    if incomplete_reviews.any?
      flash[:alert] = 'You need to complete a previously started review'
      @response = incomplete_reviews.first
    else
      # Find responses awaiting review that do not belong to the current user and have not been reviewed yet
      @response = Response.response_for_peer_review_by_user(@current_user)
    
      if @response.nil?
        redirect_to root_path, notice: 'You have no responses to review at this time'
      else
        # Assign the current user as the reviewer
        @response.reviewer_id = @current_user.id
        @response.save
      end
    end
  end
  
  def revise
    @response = Response.response_for_revision_by_user(@current_user)
    
    if @response.nil?
      redirect_to root_path, notice: 'You have no responses to revise'
    end
  end
  
  def delete_course_responses
    if !@current_user.is_teacher?
      redirect_to root_path, notice: 'Not authorized'
    end
    
    @current_user.taught_course.students.each do |student|
      student.responses.destroy_all
    end
    
    redirect_to :back, alert: 'Student responses deleted'
  end
  
  private
  
  def response_params
    params.require(:response).permit(:sentence1, :sentence2, :sentence3, :revised_sentence1, :revised_sentence2, :revised_sentence3, :best_sentence, :worst_sentence, :best_sentence_feedback, :worst_sentence_feedback)
  end
end
