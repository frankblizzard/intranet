class ChangeNrInProjects < ActiveRecord::Migration
  def up
    change_column :projects, :nr, :integer
    add_column :projects, :web, :boolean, :default => false
  end

  def down
    change_column :projects, :nr, :string
    remove_column :projects, :web
  end
end
