class UsersController < ApplicationController

	def show
		@users = User.all
	end

	def sign_in
	  @client_id = ENV['CLIENT_ID']
	  @state="somenonsense"
	  redirect_to "https://github.com/login/oauth/authorize?client_id=#{@client_id}&redirect_uri=http://127.0.0.1:3000/users/auth&scope=user&state=#{@state}"
	end

	def auth
	  code = params[:code]
	  state = params[:state]
	  redirect_to "https://github.com/login/oauth/access_token?client_id=#{@client_id}&client_secret=#{ENV['CLIENT_SECRET']}&code=#{code}&redirect_uri=http://127.0.0.1:3000/auth" if state == @state
	end

	def landing_page
	  @access_token = params[:access_token]
	  @user = User.find_or_create_by(access_token: @access_token)
	  session[:user_id] = @user.id
	  redirect_to root_url
	end

	def logout
	  session[:user_id] = nil
	  redirect_to root_url
	end

	private

	def user_params
		params.require(:user).permit(:password, :password_confirmation)
	end
end