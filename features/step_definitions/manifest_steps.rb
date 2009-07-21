Given /^there are no loads manifested$/ do
  Load.delete_all
end

Given /^(.*) is manifested for an? (.+) on our aircraft \"(.*)\"$/ do |jumper, jump_type, aircraft|
  And   'we own an aircraft named "' + aircraft + '"'
  And   'there is a jumper named "' + jumper + '"'
  And   'there is a jump type named "' + jump_type + '"'
  And   'there is a pilot named "Polly"'
  And   'there is equipment named "Wing Suit"'

  When  'I go to the loads page'
  And   'I follow "New"'
  And   'I choose "' + aircraft + '"'
  And   'I fill in "Jumper" with "' + jumper + '"'
  When  'I press "Submit"'
  Then  'I should be on the loads page'

  When  'I follow "Edit"'
  And   'I select "' + jump_type + '" from "Jump Type"'

  And   'I select "Polly" from "Pilot"'
  And   'I fill in "Altitude" with "11000"'
  And   'I select "Wing Suit" from "Equipment"'
  And   'I fill in "Notes" with "Level 4"'
  
  When  'I press "Submit"'
  Then  'I should see "success"'
  And   'I should be on the loads page'
end

Given /^(.*) is manifested for an? (.+) on other aircraft \"(.*)\"$/ do |jumper, jump_type, aircraft|
  And   'there is a jumper named "' + jumper + '"'
  And   'there is a jump type named "' + jump_type + '"'

  When  'I go to the loads page'
  And   'I follow "New"'
  And   'I fill in "Jumper" with "' + jumper + '"'
  When  'I press "Submit"'
  When  'I follow "Edit"'
  
  And   'I fill in "Other" with "' + aircraft + '"'
  And   'I select "' + jump_type + '" from "Jump Type"'

  When  'I press "Submit"'
  Then  'I should see "success"'
end

Given /^a load manifested on our aircraft$/ do
  Given 'Johnny is manifested for a Tandem on our aircraft "42Z"'
end

When /^I edit the load$/ do
  Given 'I am on the loads page'
  And   'I follow "Edit"'
end

Given /^a load was manifested yesterday$/ do
  Given 'Johnny is manifested for a Fun Jump on our aircraft "42Z"'
  When  'I edit the load'
  And   'I select "' + Date.yesterday.strftime('%b %d, %Y') + '" as the date'
  And   'I press "Submit"'
end

Given /^a load is manifested today$/ do 
  Given 'Jenny is manifested for a Fun Jump on our aircraft "1EE"'
end

When /^(.+) takes the slot$/ do |jumper|
  Given 'there is a jumper named "' + jumper + '"'
  When  'I go to the loads page'
  And   'I follow "Edit"'
  And   'I select "' + jumper + '" from "Jumper"'
  And   'I press "Submit"'
end

Then /^(.*) should be manifested for an? (.+) on our aircraft \"(.*)\"$/ do |jumper, jump_type, aircraft|
  When 'I edit the load'
  Then 'I should see "' + aircraft + '"'
  And  'I should see "Polly"'
  And  'I should see "' + jumper + '"'
  And  'I should see "' + jump_type + '"'

  And  'I should see "Wing Suit"'
  And  'I should see "Level 4"'
  And  'I should see "11000"'
  And  'I should see "123.45"'
  
  When 'I go to the loads page' 
  Then 'I should see "' + aircraft + '"' 
end

Then /^(.*) should be manifested for an? (.+) on other aircraft \"(.*)\"$/ do |jumper, jump_type, aircraft|
  When 'I edit the load'
  Then 'the "Other" field should contain "' + aircraft + '"'
  And  '"' + aircraft + '" should not be a radio button'
  And  'the "Jumper" field should contain "' + jumper + '"'
  And  'I should see "' + jump_type + '"'

  When 'I go to the loads page' 
  Then 'I should see "' + aircraft + '"' 
end

Then /^"([^\"]*)" should not be a radio button$/ do |aircraft|
  lambda { choose(aircraft) }.should raise_error(Webrat::NotFoundError)
end

Then /^I should see 6 slots$/ do
  one_for_javascript_add_slot = 1
  response.body.scan(/Jumper/).length.should == 6 + one_for_javascript_add_slot
end

Then /^load (.+) is on "(.+)"$/ do |number, aircraft|
  When 'I go to the loads page'
  Then 'I should see something like "' + number + ':.*' + aircraft + '"'
end

Then /^today\'s load should be load 1$/ do 
  Then 'load 1 is on "1EE"'
end

Then /^today\'s load should be listed above yesterday\'s$/ do
  Then "1EE should be listed above 42Z on the loads page"
end

