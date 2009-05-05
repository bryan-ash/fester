class AddAltitudeToSlot < ActiveRecord::Migration
  def self.up
    add_column :slots, :altitude, :integer
  end

  def self.down
    remove_column :slots, :altitude
  end
end
