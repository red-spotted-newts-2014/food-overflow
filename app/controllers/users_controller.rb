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
    if session[:user_id].nil?
      render json: false
    else
      @name = User.find(session[:user_id]).name
      render json: {name: @name }
    end
  end

  def current_votes
    p session[:user_id]
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
