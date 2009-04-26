class CreateLoads < ActiveRecord::Migration
  def self.up
    create_table :loads do |t|
      t.datetime :date
      t.integer :aircraft_id

      t.timestamps
    end
  end

  def self.down
    drop_table :loads
  end
end
