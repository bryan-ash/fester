Given /^there are no loads manifested$/ do
  Load.delete_all
end

Given /^(.*) is manifested for a (.+) on (.*)$/ do |jumper, jump_type, aircraft|
  Given 'there are no loads manifested'
  And   'we own an aircraft named "' + aircraft + '"'
  And   'there is a jumper named "' + jumper + '"'
  And   'there is a jump type named "' + jump_type + '"'

  When  'I go to the loads page'
  And   'I follow "New load"'
  And   'I choose "' + aircraft + '"'
  And   'I select "' + jumper + '" from "Jumper"'
  And   'I select "' + jump_type + '" from "Jump Type"'
  And   'I fill in "Cost" with "100"'
  And   'I press "Submit"'

  Then  'I should see "success"'
end

Given /^a load manifested on our aircraft$/ do
  Given 'Johnny is manifested for a Tandem on 42Z'
end

When /^I edit the load$/ do
  visit '/loads/1/edit'
end

When /^(.+) takes the slot$/ do |jumper|
  Given 'there is a jumper named "' + jumper + '"'
  When  'I go to the loads page'
  And   'I follow "Edit"'
  And   'I select "' + jumper + '" from "Jumper"'
  And   'I press "Submit"'
end

Then /^(.*) should be manifested for a (.+) on our aircraft \"(.*)\"$/ do |jumper, jump_type, aircraft|
  When 'I edit the load'
  Then 'I should see "' + aircraft + '"'
  And  'I should see "' + jumper + '"'
  And  'I should see "' + jump_type + '"'
end

Then /^(.*) should be manifested for a (.+) on other aircraft \"(.*)\"$/ do |jumper, jump_type, aircraft|
  When 'I edit the load'
  Then 'the "Other" field should contain "' + aircraft + '"'
  And  '"' + aircraft + '" should not be a radio button'
  And  'I should see "' + jumper + '"'
  And  'I should see "' + jump_type + '"'
end

Then /^"([^\"]*)" should not be a radio button$/ do |aircraft|
  lambda { choose(aircraft) }.should raise_error(Webrat::NotFoundError)
end

Then /^I should see 6 slots$/ do
  one_for_javascript_add_slot = 1
  response.body.scan(/Jumper/).length.should == 6 + one_for_javascript_add_slot
end
