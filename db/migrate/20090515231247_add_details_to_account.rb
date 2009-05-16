class AddDetailsToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :email, :string
    add_column :accounts, :contact, :string
    add_column :accounts, :gender, :string
    add_column :accounts, :dob, :date
  end

  def self.down
    remove_column :accounts, :dob
    remove_column :accounts, :gender
    remove_column :accounts, :contact
    remove_column :accounts, :email
  end
end
