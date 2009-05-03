class AddOursToAircraft < ActiveRecord::Migration
  def self.up
    add_column :aircrafts, :ours, :boolean, :default => false
  end

  def self.down
    remove_column :aircrafts, :ours
  end
end
