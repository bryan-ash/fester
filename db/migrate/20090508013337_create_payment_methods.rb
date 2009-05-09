class CreatePaymentMethods < ActiveRecord::Migration
  def self.up
    create_table :payment_methods do |t|
      t.string :name

      t.timestamps
    end

    PaymentMethod.create :name => 'Cash'
    PaymentMethod.create :name => 'Check'
    PaymentMethod.create :name => 'Credit'
    PaymentMethod.create :name => 'Misc Charge'
    PaymentMethod.create :name => 'Payroll'
    PaymentMethod.create :name => 'Misc Credit'
  end

  def self.down
    drop_table :payment_methods
  end
end
