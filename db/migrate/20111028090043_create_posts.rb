class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :user_id
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
