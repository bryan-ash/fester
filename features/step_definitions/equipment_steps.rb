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

When /^I rename "(.+)" to "(.+)"$/ do |from, to|
  When 'I go to the equipment page'
  And  'I follow "' + from + '"'
  
  When 'I fill in "Name" with "' + to + '"'
  And  'I press "Submit"'
end

Then /^equipment "(.+)" should no longer be available$/ do |equipment|
  When 'I go to the equipment page'
  Then 'I should not see "' + equipment + '"'
end

Then /^equipment "(.+)" should be available$/ do |equipment|
  When 'I go to the equipment page'
  Then 'I should see "' + equipment + '"'
end

