Given /^there are no loads manifested$/ do
  Load.delete_all
end

Given /^"(.*)" is manifested on "(.*)"$/ do |jumper, aircraft|
  Given 'there are no loads manifested'
  And   'there is an aircraft named "' + aircraft + '"'
  And   'there is a jumper named "' + jumper + '"'
  When  'I go to the loads page'
  And   'I follow "New load"'
  And   'I fill in "Aircraft" with "' + aircraft + '"'
  And   'I select "' + jumper + '" from "Jumper"'
  And   'I press "Submit"'
end

