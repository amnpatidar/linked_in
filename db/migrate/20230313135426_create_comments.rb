class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :likes
      t.references :commentable,polymorphic: true, null: false

      t.timestamps
    end
  end
end
