class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date   :birthday
      t.string :street
      t.string :zip
      t.string :city
      t.text :bio
      t.string :avatar
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
