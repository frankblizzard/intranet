class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.date :date
      t.float :amount
      t.boolean :extra, :default => false
      t.boolean :holiday, :default => false
      t.boolean :ill, :default => false
      t.integer :project_id
      t.integer :user_id
      t.integer :task_id
      t.text  :description

      t.timestamps
    end
  end
end
