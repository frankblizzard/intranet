class ChangePaymentWithinClients < ActiveRecord::Migration
  def up
    rename_column :clients, :payment_withing, :payment_within
  end

  def down
    rename_column :clients, :payment_within, :payment_withing
  end
end
