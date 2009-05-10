class RenameTransactionMethodToPaymentMethod < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :method_id, :payment_method_id
  end

  def self.down
    rename_column :transactions, :payment_method_id, :method_id
  end
end
