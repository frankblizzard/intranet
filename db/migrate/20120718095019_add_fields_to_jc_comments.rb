class AddFieldsToJcComments < ActiveRecord::Migration
  def change
    add_column :jc_comments, :x1, :integer
    add_column :jc_comments, :x2, :integer
    add_column :jc_comments, :y1, :integer
    add_column :jc_comments, :y2, :integer
    add_column :jc_comments, :h, :integer
    add_column :jc_comments, :w, :integer
  end
end
