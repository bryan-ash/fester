class AddJumpTypeToSlot < ActiveRecord::Migration
  def self.up
    add_column :slots, :jump_type_id, :integer
  end

  def self.down
    remove_column :slots, :jump_type_id
  end
end
