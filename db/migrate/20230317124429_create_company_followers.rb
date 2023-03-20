class CreateCompanyFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :company_followers do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
