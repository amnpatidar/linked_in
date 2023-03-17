class AddColumnUserPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_name, :string
    add_column :comments, :user_name, :string
  end
end
