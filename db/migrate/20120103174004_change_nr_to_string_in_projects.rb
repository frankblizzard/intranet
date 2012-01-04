class ChangeNrToStringInProjects < ActiveRecord::Migration
  def up
    change_column :projects, :nr, :string
  end

  def down
    change_column :projects, :nr, :integer
  end
end
