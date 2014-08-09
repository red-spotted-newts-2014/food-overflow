# resources :comments, only: [:new, :create, :edit, :show, :update, :destroy]

class CommentsController < ApplicationController

	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			redirect_to root_url
		else
			flash[:notice] = "Something was wrong. Please try again."
			redirect_to root_url
		end
	end

end