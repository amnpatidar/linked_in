class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
  	# byebug 
  	@friendship = Friendship.all.frend
  	@request = Friendship.all.requests
  end

  def show

  end

	def new 

	end

	def create
		@user = current_user.friendships.new(user_id: current_user.id,friend_id: params[:friendship][:friend_id], requester_id: params[:friendship][:requester_id])
		# @friend = Friendship.new(user_id: params[:friendship][:friend_id],friend_id: params[:friendship][:user_id], requester_id: params[:friendship][:requester_id])
		@user.save #&& @friend.save
		flash[:notice] = "Added friend."
		redirect_to friendships_path
		
		# redirect_to @friend
	end

	def update
		# byebug
		friend = Friendship.find_by(id: params[:id])
		friend.update(status: true,user_id: current_user.id)
		# @user.status = Friendship.friends
		redirect_to friendships_path
	end

	def destroy 
		# byebug
		friend = Friendship.find_by(id: params[:id])
		friend.destroy
		redirect_to friendships_path
	end

	# def request

	# end
end
