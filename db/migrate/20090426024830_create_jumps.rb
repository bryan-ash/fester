class CreateJumps < ActiveRecord::Migration
  def self.up
    create_table :jumps do |t|
      t.integer :load_id
      t.integer :jumper_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jumps
  end
end
