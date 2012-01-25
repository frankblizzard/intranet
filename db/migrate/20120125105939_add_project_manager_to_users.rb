class AddProjectManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :project_manager, :boolean, :default => false
  end
end
