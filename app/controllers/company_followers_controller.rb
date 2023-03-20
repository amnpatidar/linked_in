class CompanyFollowersController < ApplicationController
  before_action :authenticate_user!
	def create
		@company = Company.find_by(id: params[:company_id])
		unless current_user.companies.ids.include?@company_id
			@follwer = @company.company_followers.new
			@follwer.user_id = current_user.id
			if @follwer.save
				redirect_to company_path(@company.id)
			end
		end
	end

	def destroy
		@company = Company.find_by(id: params[:company_id])
		@follwer = @company.company_followers.find_by(id: params[:id])
		@follwer.destroy
		redirect_to company_path(@company.id)
	end
	
end
