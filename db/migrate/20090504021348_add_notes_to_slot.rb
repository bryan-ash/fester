class AddNotesToSlot < ActiveRecord::Migration
  def self.up
    add_column :slots, :notes, :string
  end

  def self.down
    remove_column :slots, :notes
  end
end
