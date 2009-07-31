Given /^an account to be imported already exists$/ do
  Given 'there is a jumper named "Payer, Prompt"'

  existing_user.dob.should be_nil
end

Given /^there is a database problem with accounts$/ do 
  Account.stub!(:find).and_raise(RuntimeError)
end

When /^I import a file with valid data for 3 new accounts$/ do
  visit new_csv_import_path
  attach_file(:path, File.join(RAILS_ROOT, 'features', 'import_files', 'valid_data.csv'))  
  click_button 'Import'
end

When /^I import a file that contains that account$/ do
  When 'I import a file with valid data for 3 new accounts'
end

When /^I attempt to import without providing a file path$/ do 
  visit new_csv_import_path
  click_button 'Import'
end

Then /^the accounts should be imported$/ do
  Account.count.should == 3
  johnny = Account.find_by_name 'Jumper, Johnny'
  johnny.created_at.to_date.should == Date.parse('7/19/2008')
#  johnny.email.should ==
#  johnny.contact.should ==
  johnny.balance.should == -23.45

  prompt = Account.find_by_name 'Payer, Prompt'
  prompt.dob.should == Date.parse('12/7/1976')
end

Then /^the existing account should be updated$/ do
  Account.count.should == 3
  prompt = existing_user
  prompt.dob.should == Date.parse('12/7/1976')
end

Then /^the accounts should not be imported$/ do
  Account.count.should == 0
  And 'I should see "CSV Import Failed"'
end

def existing_user
  Account.find_by_name 'Payer, Prompt'
end

