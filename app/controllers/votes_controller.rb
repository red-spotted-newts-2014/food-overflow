class VotesController < ApplicationController
  def create
    owner = params[:vote]["owner"]
    id = owner[2,owner.size].to_i
    upvote = params[:vote]["is_upvote"] == "true"
    if owner[0] == "q"
      @question = Question.find(id).votes.create(is_upvote: upvote)
    respond_to do |format|
      format.json {render json: @question.id.to_json}
    end
    end
    if owner[0] == "c"
      Comment.find(id).votes.create(is_upvote: upvote)
    end
    ""
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
