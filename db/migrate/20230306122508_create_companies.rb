class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_type
      t.string :specialities
      t.date :founded_in, null: false
      t.string :website
      t.string :company_size
      t.string :address
      t.string :about
      t.references :user
      t.timestamps
    end
  end
end
