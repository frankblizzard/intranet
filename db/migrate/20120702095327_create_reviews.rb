class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.datetime :date_opened
      t.datetime :date_closed
      t.integer :project_id
      t.boolean :closed
      t.integer :project_leader_id
      t.string :email_when_changed
      t.string :client_emails

      t.timestamps
    end
  end
end
