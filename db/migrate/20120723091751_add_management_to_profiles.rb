class AddManagementToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :management, :boolean, :default => false
  end
end
