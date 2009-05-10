
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Transaction" do

  it "payment method decides sign of transaction amount" do
    amount = 38.50
    
    cash = mock_model(PaymentMethod)
    cash.should_receive(:signed_amount).with(amount).and_return(-amount)

    transaction = Transaction.create! :amount => amount, :payment_method => cash
    transaction.amount.should == -amount
  end
  
  it "sums transactions belonging to an account" do
    Transaction.create! :account_id => 2, :amount => -76.58
    Transaction.create! :account_id => 2, :amount => 200.00
    Transaction.sum_for_account(2).should == 123.42
  end
  
end
