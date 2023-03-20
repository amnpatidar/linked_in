class Job < ApplicationRecord
  belongs_to :company
  has_many :users_jobs, dependent: :destroy
end
