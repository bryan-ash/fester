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
  And   'I press "Submit"'
end

Then /^"([^\"]*)" should not be a radio button$/ do |aircraft|
  lambda { choose(aircraft) }.should raise_error(Webrat::NotFoundError)
end
