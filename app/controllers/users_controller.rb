class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def sign_in
	  @client_id = ENV['CLIENT_ID']
	  @state="somenonsense"
	  redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['CLIENT_ID']}&redirect_uri=http://127.0.0.1:3000/users/auth&scope=user&state=#{@state}"
	end

	def auth
	  code = params[:code]
	  state = params[:state]
	  @token_req = HTTParty.post("https://github.com/login/oauth/access_token",
	  {:client_id => @client_id,
	  :client_secret => ENV['CLIENT_SECRET'],
	  :code => code},
	  :accept => :json)
	  @access_token = JSON.parse(@token_req)['access_token']
	  scopes = JSON.parse(@token_req)['scope'].split(',')
	  has_user_email_scope = scopes.include?('user:email')
	  auth_result = JSON.parse(HTTParty.get("https://api.github.com/user", {params: {access_token: access_token}}))
	  if has_user_email_scope
	  	@email = auth_result['private_emails'] = JSON.parse(HTTParty.get("https://api.github.com/user/emails", {params: {access_token: access_token}}))
	  end
	  

	  # redirect_to "https://github.com/login/oauth/access_token?client_id=#{@client_id}&client_secret=#{ENV['CLIENT_SECRET']}&code=#{code}" if state == @state

	end

	def landing_page
		puts "*****"
	  	p @access_token
	  	p @email
	  	puts "*****"
	  @access_token = params[:access_token]
	  @user = User.find_or_create_by(access_token: @access_token)
	  session[:user_id] = @user.id
	  redirect_to root_url
	end

	def logout
	  session[:user_id] = nil
	  redirect_to root_url
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

	def show
		@user = User.find(params[:id])
	end

  private
    def user_params
      params.require(:user).permit!
    end
end
