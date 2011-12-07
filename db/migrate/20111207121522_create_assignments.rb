class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :profile_id
      t.integer :project_id
      t.string :role

      t.timestamps
    end
  end
end
