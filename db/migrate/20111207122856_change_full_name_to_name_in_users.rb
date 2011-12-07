class ChangeFullNameToNameInUsers < ActiveRecord::Migration
  def up
    rename_column :profiles, :full_name, :name
  end

  def down
    rename_column :profiles, :name, :full_name
  end
end
