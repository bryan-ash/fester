
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Transaction" do

  it "sums transactions belonging to an account" do
    Transaction.create! :account_id => 2, :method_id => 1, :amount => -76.58
    Transaction.create! :account_id => 2, :method_id => 2, :amount => 200.00
    Transaction.sum_for_account(2).should == 123.42
  end
  
end
