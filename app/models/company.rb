class Company < ApplicationRecord
	belongs_to :user 
	has_many :posts, as: :postable
	validates :company_name, presence: true
end
