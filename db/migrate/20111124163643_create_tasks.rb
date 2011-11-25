class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.date :deadline

      t.timestamps
    end
  end
end
