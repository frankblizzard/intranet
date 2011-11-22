class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :full_name
      t.string :client_nr
      t.string :website

      t.timestamps
    end
  end
end
