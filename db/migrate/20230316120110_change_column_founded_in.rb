class ChangeColumnFoundedIn < ActiveRecord::Migration[6.1]
  def up
    change_column :companies, :founded_in, :string
  end

  def down
    change_column :companies, :founded_in, :integer
  end
end
