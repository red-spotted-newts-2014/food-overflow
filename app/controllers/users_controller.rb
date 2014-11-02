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
    if current_user
      @name = current_user.name
      render json: {name: @name }
    else
      render json: false
    end
  end

  def current_votes
    if current_user
      votes = current_user.votes.where(votable_type: "question")
      @vote_stats = {}
      votes.each do |vote|
        @vote_stats[vote.votable_id] = vote.is_upvote
      end
      render json: @vote_stats
    else
      render json: nil
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
