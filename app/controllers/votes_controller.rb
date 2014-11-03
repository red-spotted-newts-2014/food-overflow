class VotesController < ApplicationController

  def create
  end

  def update
  end

  def index
    @vote = Vote.new
    @votes = Vote.all
  end

  def find_per_question
  end

  private
  def vote_params
    params.require(:vote).permit!
  end
end
