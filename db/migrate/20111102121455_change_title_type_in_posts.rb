class ChangeTitleTypeInPosts < ActiveRecord::Migration
  def up
    change_column :posts, :title, :string
  end

  def down
    change_column :posts, :title, :text
  end
end
