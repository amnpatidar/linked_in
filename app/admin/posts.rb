ActiveAdmin.register Post do


	form do |f|
    f.inputs "image" do
    f.input :article
    f.input :image,as: :file
    
		end
		f.actions
  end

	permit_params :image, :article, :company_id, :user_id
	
end