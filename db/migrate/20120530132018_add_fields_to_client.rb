class AddFieldsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :rg_adress, :text
    add_column :clients, :billing_code, :string
    add_column :clients, :payment_withing, :int, :default => 14
  end
end
