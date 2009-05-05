class AddCostToSlot < ActiveRecord::Migration
  def self.up
    add_column :slots, :cost, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :slots, :cost
  end
end
