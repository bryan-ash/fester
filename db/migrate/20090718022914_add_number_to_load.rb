class AddNumberToLoad < ActiveRecord::Migration
  def self.up
    add_column :loads, :number, :integer
  end

  def self.down
    remove_column :loads, :number
  end
end
