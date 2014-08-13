class HashtagsController < ApplicationController
	def index
		@hashtags = Hashtag.all.sort_by{|tag| tag.title}
		@hashtags_tables = @hashtags.each_slice(3).each_slice(5).to_a
	end

	def show
		@hashtag = Hashtag.find(params[:id])
	end

	def questions
		@tag = Hashtag.find(params[:id])
		@questions = @tag.questions
	end

	def create
		@title = params["key"]
		@tag = Hashtag.find_or_create_by(title: @title)
		respond_to do |format|
    if @tag
    	format.json {render json: @tag.id.to_json}
     else
       flash[:notice] = "Something was wrong. Please try again."
     end
    end
	end

end
