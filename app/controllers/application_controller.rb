class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	
	def configure_permitted_parameters
	# byebug
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :user_type, :qualification, :skill, :birth_date, :country, :city,:image]) 
	end
	
  def name
    "#{first_name} #{middle_name} #{last_name}".titleize
  end

end
