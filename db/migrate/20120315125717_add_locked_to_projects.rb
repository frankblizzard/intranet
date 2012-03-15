class AddLockedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :locked, :boolean
  end
end
