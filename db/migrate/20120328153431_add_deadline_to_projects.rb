class AddDeadlineToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :deadline, :date, :default => Time.now
  end
end
