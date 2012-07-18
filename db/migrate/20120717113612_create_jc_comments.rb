class CreateJcComments < ActiveRecord::Migration
  def change
    create_table :jc_comments do |t|
      t.integer :user_id
      t.integer :commentable_id
      t.string :commentable_type
      t.text :content
      t.integer :x1
      t.integer :y1
      t.integer :x2
      t.integer :y2
      t.integer :w
      t.integer :h

      t.timestamps
    end
  end
end
