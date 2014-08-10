# resources :comments, only: [:new, :create, :edit, :show, :update, :destroy]

class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to root_url
		else
			flash[:notice] = "Something was wrong. Please try again."
			redirect_to root_url
		end
	end

	private
    def comment_params
      params.require(:comment).permit!
    end
end