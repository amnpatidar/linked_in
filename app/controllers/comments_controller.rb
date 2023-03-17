class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable
	def show
		# byebug
		@comment =  if params[:comment_id]
	  									Comment.find_by(id: params[:comment_id])
	  								else
	  									Comment.find_by(id: params[:id])
	  								end
		byebug
		user = User.find_by(id: @comment.user_id)
		@comment.user_name = user.full_name
	end

	def new
		byebug
	  @comment = @commentable.comments.new
	end

	def create
		@commentable = if params[:comment_id]
	  									Comment.find_by(id: params[:comment_id])
	  								else
	  									Post.find_by(id: params[:post_id])
	  								end
	  @comment = @commentable.comments.new(comment_params)									
	  @comment.user_id = current_user.id
	  # @comment.user_name = current_user.full_name
	  @comment.save
	  byebug
	  if  params[:comment_id] == nil
	  	redirect_to post_path(params[:post_id])
		else
	  	redirect_to post_path(params[:comment_id])
	  end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_commentable
		# byebug
			@commentable = 
		  								if params[:post_id]
		  									Comment.find_by(id: params[:post_id])
		  								elsif params[:comment_id]
		  									Comment.find_by(id: params[:comment_id])
		  								else
		  									Comment.find_by(id: params[:id])
		  								end
	end
end
