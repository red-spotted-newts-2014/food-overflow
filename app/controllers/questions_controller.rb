class QuestionsController < ApplicationController
  def new
    
  end

  def create

  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
