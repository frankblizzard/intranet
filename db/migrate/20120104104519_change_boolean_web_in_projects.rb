class ChangeBooleanWebInProjects < ActiveRecord::Migration
  def up
    change_column :projects, :web, :boolean, :default => false
    change_column :projects, :active, :boolean, :default => true
  end

  def down
    change_column :projects, :web, :integer
    change_column :projects, :active, :integer
  end
end
