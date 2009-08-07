
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'string'

describe "String.reverse_first_last_names" do

  it "converts 'Jumper, Johnny' into 'Johnny Jumper'" do
    'Jumper, Johnny'.reverse_first_last_names.should == 'Johnny Jumper'
  end

  it "doesn't affect a string without a comma" do
    'Bobby Bounce'.reverse_first_last_names.should == 'Bobby Bounce'
  end

  it "preserves (nickname)" do
    'Last, First (Nickname)'.reverse_first_last_names.should == 'First (Nickname) Last'
  end

  it "preserves hyphenated last names" do
    'Last-Name, First'.reverse_first_last_names.should == 'First Last-Name'
  end
  
  it "preserves hyphenated last names" do
    'Last, First-Name'.reverse_first_last_names.should == 'First-Name Last'
  end
  
end
