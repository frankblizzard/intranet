class RenameClientIsClient < ActiveRecord::Migration
  def change
    rename_column :profiles, :client, :is_client
  end
end
