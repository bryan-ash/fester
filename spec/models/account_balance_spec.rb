
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Account balance" do

  it "is retrieved from the sum of transactions" do
    jumper = Account.create(:name => "Johnny")
    Transaction.should_receive(:sum_for_account).with(jumper.id).and_return(300.00)
    jumper.balance == 300.00
  end
  
end
