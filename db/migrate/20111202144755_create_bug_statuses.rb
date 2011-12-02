class CreateBugStatuses < ActiveRecord::Migration
  def change
    create_table :bug_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
