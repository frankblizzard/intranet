class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :nr
      t.string :name
      t.integer :client_id
      t.text :description
      t.boolean :active, :default => false
      t.boolean :hidden, :default => false

      t.timestamps
    end
  end
end
