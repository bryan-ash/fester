class AddSlotToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :slot_id, :integer
  end

  def self.down
    remove_column :transactions, :slot_id
  end
end
