class AddCreditToPaymentMethod < ActiveRecord::Migration
  def self.up
    add_column :payment_methods, :credit, :boolean
  end

  def self.down
    remove_column :payment_methods, :credit
  end
end
