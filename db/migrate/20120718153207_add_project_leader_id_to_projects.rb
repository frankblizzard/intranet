class AddProjectLeaderIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_leader_id, :integer
  end
end
