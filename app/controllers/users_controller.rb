class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "ERROR"
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def current
    render json: nil if session[:user_id].nil?
    render json: session[:user_id]
  end

  def current_votes
    render json: nil if session[:user_id].nil?
    user = User.find(session[:user_id])
    votes = user.votes.where(votable_type: "question")
    @vote_stats = {}
    votes.each do |vote|
      @vote_stats[vote.votable_id] = vote.is_upvote
    end
    render json: @vote_stats
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
