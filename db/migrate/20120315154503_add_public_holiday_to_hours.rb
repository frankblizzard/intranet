class AddPublicHolidayToHours < ActiveRecord::Migration
  def change
    add_column :hours, :public_holiday, :boolean
    add_column :hours, :comp_time, :boolean
  end
end
