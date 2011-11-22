class AddProjectStatusIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_status_id, :integer, :default => 1
  end
end
