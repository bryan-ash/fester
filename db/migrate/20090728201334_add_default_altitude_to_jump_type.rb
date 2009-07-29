class AddDefaultAltitudeToJumpType < ActiveRecord::Migration
  def self.up
    add_column :jump_types, :default_altitude, :integer
  end

  def self.down
    remove_column :jump_types, :default_altitude
  end
end
