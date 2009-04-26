class CreateAircrafts < ActiveRecord::Migration
  def self.up
    create_table :aircrafts do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :aircrafts
  end
end
