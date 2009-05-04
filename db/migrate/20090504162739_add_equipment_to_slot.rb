class AddEquipmentToSlot < ActiveRecord::Migration
  def self.up
    add_column :slots, :equipment_id, :integer
  end

  def self.down
    remove_column :slots, :equipment_id
  end
end
