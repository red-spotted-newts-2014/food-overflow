class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to votes_path
    else
      flash[:notice] = "There was an error"
      redirect_to votes_path
    end
  end

  def update
  end

  def index
    @vote = Vote.new
    @votes = Vote.all
  end

  private
  def vote_params
    params.require(:vote).permit!
  end
end
