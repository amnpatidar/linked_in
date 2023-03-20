class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@friendship = current_user.friendships.friends
  	@request = current_user.friendships.requests(current_user.id)
  end

  def show

  end

	def new 

	end

	def create
		@user = current_user.friendships.new(user_id: current_user.id,friend_id: params[:friendship][:friend_id], requester_id: params[:friendship][:requester_id])
		@user.save
		flash[:notice] = "Added friend."
		redirect_to user_friendships_path
		# @friend = Friendship.new(user_id: params[:friendship][:friend_id],friend_id: params[:friendship][:user_id], requester_id: params[:friendship][:requester_id])
		# @friend.save
		# redirect_to @friend
	end

	def update
		friend = Friendship.find_by(id: params[:id])
		 friend.update(status: true)
		# @user.status = Friendship.friends
		redirect_to user_friendships_path
	end

	# def request

	# end
end
