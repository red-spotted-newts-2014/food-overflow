class CommentsController < ApplicationController
  def new
    @context = context
    @comment = @context.comments.new(comment_params)
  end

  def create
    @context = context
    @comment = @context.comments.new(comment_params)
    if @comment.save
      redirect_to context_url(context)
    else
      flash[:notice] = "Something was wrong. Please try again."
      redirect_to root_url
    end
  end

private
  def comment_params
    params.require(:comment).permit!
  end

  def context
    if params[:question_id]
      Question.find(params[:question_id])
    else
      Comment.find(params[:comment_id])
    end
  end

  def context_url(context)
    if context.class == Question
      question_path(context)
    else
      question_path(context.commentable)
    end
  end
end