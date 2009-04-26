class CreateJumpers < ActiveRecord::Migration
  def self.up
    create_table :jumpers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :jumpers
  end
end
