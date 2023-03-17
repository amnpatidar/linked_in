class PostsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_commentable

  def index 
  	# byebug
  	@posts = Post.all 
  	# @posts.user = current_user
  end

  def show
  	# byebug
  	@post =  Post.find(params[:id])
  end

  def new
  	
  end

	def create
		post = current_user.posts.new(post_params)
		post.user_name = current_user.full_name
			# byebug
		if post.save
			redirect_to post
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@post = current_user.posts.new
	end

	def update
	 @post = current_user.posts.new(post_params)
	 if @post.update
	 	redirect_to @post
	 else
	 	render :edit, status: :unprocessable_entity
	 end
	end

	def destroy
		byebug
		@post = Post.find_by(id: params[:id])
		@post.destroy
		redirect_to post_path
	end

	private

	def set_commentable
		# byebug	
		@commentable = Post.find_by(id: params[:id])
	end


	def post_params
		params.require(:post).permit(:article, :image)
	end

end