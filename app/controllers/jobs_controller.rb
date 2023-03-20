class JobsController < ApplicationController
  before_action :authenticate_user!
	def index
		# @company = Company.find_by(id: params[:company_id])
		@jobs = Job.all
	end

	def show
		# @company = Company.find_by(id: params[:company_id])
		@job = Job.find_by(id: params[:id])
	end

	def new
		@company = Company.find_by(id: params[:company_id])
		@job = @company.jobs.new
	end

	def create
		@company = Company.find_by(id: params[:company_id])
		@job = @company.jobs.new(job_params)
		if @job.save
			redirect_to company_path(params[:company_id])
		else
			render :new, status: :unprocessable_entity
		end
	end


	private

	def job_params
		params.require(:job).permit(:title,:description,:salary,:position)
	end
end
