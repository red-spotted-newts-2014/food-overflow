class VotesController < ApplicationController

  def create
    if logged_in
      @vote = Vote.where(user_id: session[:user_id]).find_or_initialize_by(vote_params)
      set_vote
      save_vote
    else
      render json: nil
    end
  end

  def update
    if logged_in
      set_vote
      save_vote
    end
  end

  private

  def set_vote
    @vote ||= Vote.find(params[:id])
    p upvote_param
    if @vote.is_upvote == upvote_param[:is_upvote]
      @vote.is_upvote = nil
    else
      @vote.is_upvote = upvote_param[:is_upvote]
    end
  end

  def save_vote
    if @vote.save
      render json: @vote.to_json
    else
      render json: nil
    end
  end


  def vote_params
    params.require(:vote).permit(:votable_type, :votable_id)
  end

  def upvote_param
    params.require(:vote).permit(:is_upvote)
  end
end
