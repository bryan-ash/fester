
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Jumper" do

  it "roles include 'Jumper'" do
    jumper = Account.create(:name => "Johnny", :jumper => true)
    jumper.roles.should include('Jumper')
  end
  
end

describe "Pilot" do

  it "roles include 'Pilot'" do
    pilot = Account.create(:name => "Polly", :pilot => true)
    pilot.roles.should include('Pilot')
  end
  
end

describe "Jumping pilot" do

  it "roles include 'Jumper' and 'Pilot'" do
    jumper = Account.create(:name => "Johnny", :jumper => true, :pilot => true)
    jumper.roles.should include('Jumper')
    jumper.roles.should include('Pilot')
  end
  
end

describe "Non-jumping, non-pilot account" do

  it "roles include 'None'" do
    account = Account.create(:name => "Maintenance Man", :jumper => false, :pilot => false)
    account.roles.should include('None')
  end
  
end

