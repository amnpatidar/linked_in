class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.boolean :status, default: false
      t.integer :friend_id
      t.integer :requester_id
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
