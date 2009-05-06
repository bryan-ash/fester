class RenameJumperToAccount < ActiveRecord::Migration
  def self.up
    rename_table :jumpers, :accounts
    
    rename_column :slots, :jumper_id, :account_id
  end

  def self.down
    rename_table :accounts, :jumpers
    
    rename_column :slots, :account_id, :jumper_id
  end
end
