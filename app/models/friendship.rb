class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  scope :frend, -> { where(status: true) }
  scope :requests, ->{ where(status: false) }
  

  private

  # def create_inverse
  #   self.class.create(user_id: self.friend.id, friend_id: self.user.id, status: 'pending')
  # end

end