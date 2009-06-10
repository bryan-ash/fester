When /^I import a file with valid data for 3 new accounts$/ do
  attach_file(:path, File.join(RAILS_ROOT, 'features', 'import_files', 'valid_data.csv'))  
  click_button 'Import'
end

Then /^the number of accounts should change to 3$/ do
  Account.count.should == 3
end
