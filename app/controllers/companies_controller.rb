class CompaniesController < ApplicationController
  before_action :authenticate_user!
	def index
		byebug
		@companies = Company.all
	end

	def show
		@company = Company.find_by(id: params[:id])
	end

	def new
		@company = current_user.companies.new
	end

	def create
		byebug
		@company = current_user.companies.new(company_params)
		if @company.save
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end
  
  def destroy
  	@company = Company.find_by(id: params[:id])
  	if @company.destroy
  		redirect_to root_path
  	else
  		render :show, status: :see_other
  	end
  end

	private
	def company_params
		params.require(:company).permit(:company_name,:company_size,:company_type,:specialities,:founded_in,:website,:address,:about,:user_id)
	end
end