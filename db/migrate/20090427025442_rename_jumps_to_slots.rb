class RenameJumpsToSlots < ActiveRecord::Migration
  def self.up
    rename_table :jumps, :slots
  end

  def self.down
    rename_table :slots, :jumps
  end
end
