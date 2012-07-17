class AddLockedToUsers < ActiveRecord::Migration
  def change
    add_column :profiles, :locked, :boolean, :default => false
  end
end
