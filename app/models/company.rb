class Company < ApplicationRecord
	belongs_to :user 
	has_many :jobs, dependent: :destroy
	has_many :company_followers, dependent: :destroy
	has_many :posts, as: :postable, dependent: :destroy
	validates :company_name, presence: true
end
