class AddClientToUser < ActiveRecord::Migration
  def change
    add_column :profiles, :client, :boolean
    add_column :profiles, :client_id, :int
  end
end
