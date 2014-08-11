class AuthsController < ApplicationController
  def new
    session.clear
    redirect_to root_path
  end

  def index
    @access_token = params["code"]
    @user = User.find_or_create_by(access_token: @access_token)
    session[:user_id] = @user.id
    redirect_to root_url
  end
end
