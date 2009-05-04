class CreateJumpTypes < ActiveRecord::Migration
  def self.up
    create_table :jump_types do |t|
      t.string :name

      t.timestamps
    end

    JumpType.create :name => 'Tandem'
    JumpType.create :name => 'AFF'
    JumpType.create :name => 'Fun Jump'
    JumpType.create :name => 'Static Line'
  end

  def self.down
    drop_table :jump_types
  end
end
