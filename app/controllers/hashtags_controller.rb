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
		@tag = Hashtag.new(title: params[:key])
    if @tag.save
      return
    else
      flash[:notice] = "Something was wrong. Please try again."
      render :new
    end
	end

end
