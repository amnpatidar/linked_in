class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :city
      t.string :qualification
      t.string :skill
      t.date :birth_date
      t.string :user_type

      t.timestamps
    end
  end
end
