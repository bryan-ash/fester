class RemoveBalanceFromAccount < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :balance
  end

  def self.down
    add_column :accounts, :balance, :decimal, :default => 0.0
  end
end
