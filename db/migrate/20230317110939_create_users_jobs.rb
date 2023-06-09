class CreateUsersJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :users_jobs do |t|
      t.date :joining_date
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
