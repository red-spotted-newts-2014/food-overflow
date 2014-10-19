class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid login!"
      render :new
  end

  def logout
    session.clear
    flash[:notice] = "Signed out!"
    redirect_to root_path
  end

end