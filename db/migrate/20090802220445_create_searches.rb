class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :account_name
      t.integer :payment_method_id

      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
