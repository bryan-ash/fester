class AddUsersPasswordResetFields < ActiveRecord::Migration
  def self.up
    add_column :users, :perishable_token, :string, :default => "", :null => false
    add_index  :users, :perishable_token
  end

  def self.down
    remove_index  :users, :perishable_token
    remove_column :users, :perishable_token

    add_column :users, :persistence_token, :string
  end
end
