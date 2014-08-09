class HashtagsController < ApplicationController

	def index 
		@hashtags = Hashtag.all.sort_by{|tag| tag.title}
		@hashtags_tables = @hashtags.each_slice(3).each_slice(5).to_a
	end

	def show 
		@hashtag = Hashtag.find(params[:id])
	end 

end
