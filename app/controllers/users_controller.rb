class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = current_user
	end

	def show
		# unless params[:user_id] @user = User.find(current_user.id)
 		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(current_user.id)
		@user.destroy
		redirect_to root_path
	end



	private

	def user_Params
		params.require.permit(:first_name, :last_name,:country, :city, :qualification, :skill, :birth_date, :user_type)
	end
end
