class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
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
    if @question.user.nil?
      @maker = "Anonymous"
    else
    @maker = @question.user.name
  end
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
