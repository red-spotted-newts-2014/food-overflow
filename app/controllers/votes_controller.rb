class VotesController < ApplicationController
  def create
    owner = params[:vote]["owner"]
    id = owner[2,owner.size].to_i 
    upvote = params[:vote]["is_upvote"] == "true"
    if owner[0] == "q"
      Question.find(id).votes.create(is_upvote: upvote)
    end
    if owner[0] == "c"
      Comment.find(id).votes.create(is_upvote: upvote)
    end
    return
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
