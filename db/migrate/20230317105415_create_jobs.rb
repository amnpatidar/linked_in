class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :position
      t.string :description
      t.string :salary
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
