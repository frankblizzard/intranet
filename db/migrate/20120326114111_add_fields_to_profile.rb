class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :freelancer, :boolean, :default => false
    add_column :profiles, :in_company_since, :date
    add_column :profiles, :time_mon, :float, :default => 8
    add_column :profiles, :time_tue, :float, :default => 8
    add_column :profiles, :time_wed, :float, :default => 8
    add_column :profiles, :time_thu, :float, :default => 8
    add_column :profiles, :time_fri, :float, :default => 8
  end
end
