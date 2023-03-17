ActiveAdmin.register Company do

	permit_params :company_name,:company_size,:company_type,:specialities,:founded_in,:website,:address,:about, :user_id


end
