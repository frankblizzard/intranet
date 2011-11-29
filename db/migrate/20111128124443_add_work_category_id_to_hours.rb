class AddWorkCategoryIdToHours < ActiveRecord::Migration
  def change
    add_column :hours, :work_category_id, :integer
  end
end
