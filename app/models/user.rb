
class User < ApplicationRecord
  has_one_attached :image
  has_many :companies
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, foreign_key: 'friend_id', dependent: :destroy
  has_many :posts, as: :postable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  def full_name
    "#{first_name} #{last_name}".titleize
  end


end
