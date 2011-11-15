class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :string
    add_column :users, :zip, :string
    add_column :users, :city, :string
    add_column :users, :bio, :text
    add_column :users, :bday, :date
    add_column :users, :phone, :string
    add_column :users, :freelancer, :boolean, :default => false
  end
end
