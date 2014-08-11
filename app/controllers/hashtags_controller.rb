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
		puts @title
		puts @tag = Hashtag.find_or_create_by(title: @title)
    if @tag
    	puts @tag.id
    	return @tag.id.to_json
     else
       flash[:notice] = "Something was wrong. Please try again."
       return
     end
	end

end
