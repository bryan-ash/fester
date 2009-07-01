Given /^that no equipment exists$/ do
  Equipment.delete_all
end

Given /^there is equipment named "(.*)"$/ do |equipment|
  Equipment.create! :name => equipment
end

When /^I create equipment "(.+)"$/ do |equipment|
  When 'I go to the equipment page'
  And  'I follow "New"'
  And  'I fill in "Name" with "' + equipment + '"'
  And  'I press "Submit"'  
end

When /^I delete "(.+)"$/ do |equipment|
  When 'I go to the equipment page'
  And  'I follow "delete"'
end

Then /^"(.+)" should no longer be available$/ do |equipment|
  When 'I go to the equipment page'
  Then 'I should not see "' + equipment + '"'
end

