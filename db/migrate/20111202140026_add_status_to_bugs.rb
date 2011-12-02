class AddStatusToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :bug_status_id, :integer, :default => 1
  end
end
