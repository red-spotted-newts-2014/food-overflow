class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been posted."
      redirect_to questions_url
    else
      flash[:notice] = "Something was wrong. Please try again."
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
    def question_params
      params.require(:question).permit!
    end
end
