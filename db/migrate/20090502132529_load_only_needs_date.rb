
class LoadOnlyNeedsDate < ActiveRecord::Migration
  def self.up
    change_column :loads, :date, :date
  end

  def self.down
    change_column :loads, :date, :datetime
  end
end
