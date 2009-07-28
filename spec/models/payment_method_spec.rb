
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "PaymentMethod" do

  it "applies a negative amount when the account should be credited" do
    payment_method = PaymentMethod.new(:credit => true)
    payment_method.signed_amount(38.00).should be < 0
  end
  
  it "applies a positive amount when the account should be debited" do
    payment_method = PaymentMethod.new(:credit => false)
    payment_method.signed_amount(38.00).should be > 0
  end
  
end
