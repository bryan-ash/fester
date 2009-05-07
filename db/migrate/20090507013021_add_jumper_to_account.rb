class AddJumperToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :jumper, :boolean, :default => true
  end

  def self.down
    remove_column :accounts, :jumper
  end
end
