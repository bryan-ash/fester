Given /^an account to be imported already exists$/ do
  Given 'there is a jumper named "Payer, Prompt"'
end

When /^I import a file with valid data for 3 new accounts$/ do
  visit new_csv_import_path
  attach_file(:path, File.join(RAILS_ROOT, 'features', 'import_files', 'valid_data.csv'))  
  click_button 'Import'
end

Then /^the accounts should be imported$/ do
  Account.count.should == 3
  johnny = Account.find_by_name 'Jumper, Johnny'
  johnny.created_at.to_date.should == Date.parse('7/19/2008')
#  johnny.email.should ==
#  johnny.contact.should ==

  prompt = Account.find_by_name 'Payer, Prompt'
  prompt.dob.should == Date.parse('12/7/1976')
end

Then /^only the new accounts should be imported$/ do
  Account.count.should == 3
  prompt = Account.find_by_name 'Payer, Prompt'
  prompt.dob.should be_nil
end
