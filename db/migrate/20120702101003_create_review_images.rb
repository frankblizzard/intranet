class CreateReviewImages < ActiveRecord::Migration
  def change
    create_table :review_images do |t|
      t.integer :review_id
      t.string :name
      t.integer :project_id
      t.has_attached_file :photo
      t.timestamps
    end
  end
end
