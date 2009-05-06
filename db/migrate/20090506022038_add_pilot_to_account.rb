class AddPilotToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :pilot, :boolean, :default => false
  end

  def self.down
    remove_column :accounts, :pilot
  end
end
