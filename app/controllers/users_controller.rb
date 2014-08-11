class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			flash[:notice] = "ERROR"
			render :new
		end
	end

	def index
	  @client_id = ENV['client_id']
	  @state="somenonsense"
	  redirect_to "https://github.com/login/oauth/authorize?client_id=#{@client_id}"
	end

	def auth
		p "hello"
	  code = params[:code]
	  state = params[:state]
	  redirect_to "https://github.com/login/oauth/access_token?client_id=#{@client_id}&client_secret=#{ENV['CLIENT_SECRET']}&code=#{code}&redirect_uri=http://127.0.0.1:3000/auth" if state == @state
	end

	def show
		@user = User.find(params[:id])
	end

  private
    def user_params
      params.require(:user).permit!
    end
end
