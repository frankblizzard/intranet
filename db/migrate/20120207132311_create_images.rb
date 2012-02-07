class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.float :rating
      t.string :source

      t.timestamps
    end
  end
end
