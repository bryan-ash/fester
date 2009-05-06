class AddPilotToLoad < ActiveRecord::Migration
  def self.up
    add_column :loads, :pilot_id, :integer
  end

  def self.down
    remove_column :loads, :pilot_id
  end
end
