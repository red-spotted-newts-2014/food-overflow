class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id] if logged_in
    if @question.save
      flash[:notice] = "Your question has been posted."
        render json: @question.to_json
    else
      flash[:notice] = "Something was wrong. Please try again."
      render :new
    end
  end

  def index
    @questions = Question.order_by_votes
  end

  def show
    @question = Question.find(params[:id])
    @maker = @question.user.nil? ? "Anonymous" : @question.user.name
    @loggedin = logged_in
    if logged_in
      @vote = current_user.votes.where(votable_type: "Question").find_by(votable_id: @question.id)
      @vote = @vote.is_upvote unless @vote.nil?
    else
      @vote = nil
    end
    @total_votes = @question.info[:total_votes]
    @total_votes = @vote ? (@total_votes - 1) : (@total_votes + 1) unless @vote.nil?
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Your question was successfully updated."
      redirect_to questions_url
    else
      flash[:notice] = "Something was wrong. Please try again."
      render :edit
    end

  end

  def destroy
    @question = Question.find(params[:id])
    if @question.delete
      flash[:notice] = "Your question was successfully deleted."
      redirect_to questions_url
    else
      flash[:notice] = "Something was wrong. Please try again."
      render :edit
    end
  end

  private
    def question_params
      params.require(:question).permit!
    end
end
