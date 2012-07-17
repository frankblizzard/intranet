class AddFeedbackEnabledToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :feedback_enabled, :boolean, :default => false
  end
end
