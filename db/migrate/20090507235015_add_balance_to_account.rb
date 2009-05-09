class AddBalanceToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :balance, :decimal, :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  def self.down
    remove_column :accounts, :balance
  end
end
