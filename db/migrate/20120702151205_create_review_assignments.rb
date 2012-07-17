class CreateReviewAssignments < ActiveRecord::Migration
  def change
    create_table :review_assignments do |t|
      t.integer :profile_id
      t.integer :review_id

      t.timestamps
    end
  end
end
