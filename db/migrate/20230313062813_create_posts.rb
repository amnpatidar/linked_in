class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :article
      t.integer :postable_id
      t.string :postable_type

      t.timestamps
    end
    add_index :posts, [:postable_type, :postable_id]
  end
end
