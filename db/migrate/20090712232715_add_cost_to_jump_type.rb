class AddCostToJumpType < ActiveRecord::Migration
  def self.up
    add_column :jump_types, :cost, :decimal, :precision => 10, :scale => 2, :default => 0.00
  end

  def self.down
    remove_column :jump_types, :cost
  end
end
