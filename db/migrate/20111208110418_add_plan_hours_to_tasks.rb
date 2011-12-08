class AddPlanHoursToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :plan_hours, :float
  end
end
