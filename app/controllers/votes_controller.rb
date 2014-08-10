class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect
    else

    end
  end

  def update
  end

  def index
  end

  private
  def vote_params
    params.require(:vote).permit!
  end
end
