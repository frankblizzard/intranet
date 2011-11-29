class CreateWorkCategories < ActiveRecord::Migration
  def change
    create_table :work_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
