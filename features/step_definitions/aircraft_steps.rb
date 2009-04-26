Given /^that no aircraft exist$/ do
  Aircraft.delete_all
end

Given /^there is an aircraft named "(.*)"$/ do |aircraft|
  Aircraft.create! :name => aircraft
end

When /^I create aircraft "(.*)" with (.*) slots$/ do |aircraft, slots|
  When 'I go to the aircraft page'
  And  'I follow "New aircraft"'
  And  'I fill in "Name" with "' + aircraft + '"'
  And  'I fill in "Capacity" with "' + slots + '"'
  And  'I press "Create"'
end
