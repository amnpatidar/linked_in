class Post < ApplicationRecord
  belongs_to :postable,polymorphic: true
  has_many :comments, as: :commentable
  has_one_attached :image
  # belongs_to :company, optional: true
  # belongs_to :user, optional: true
end
