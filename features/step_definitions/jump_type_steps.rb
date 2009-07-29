Given /^that no jump types exist$/ do
  JumpType.delete_all
end

Given /^there is a jump type named "(.*)"$/ do |jump_type|
  JumpType.create! :name => jump_type
end

Given /^a Tandem costs \$200$/ do 
  Given 'there is a jump type named "Tandem"'
  And   'I am on the jump types page'
  When  'I follow "Tandem"'
  And   'I fill in "Cost" with "200"'
  And   'I press "Submit"'
  Then  'I should be on the jump types page'
end

Given /^the default altitude for a Tandem is 12000 feet$/ do 
  Given 'there is a jump type named "Tandem"'
  And   'I am on the jump types page'
  When  'I follow "Tandem"'
  And   'I fill in "Default Altitude" with "12000"'
  And   'I press "Submit"'
  Then  'I should be on the jump types page'  
end

When /^I create a jump type named "(.+)"$/ do |name|
  When 'I go to the jump types page'
  And  'I follow "New"'
  And  'I fill in "Name" with "' + name + '"'
  And  'I press "Submit"'
  Then 'I should be on the jump types page'
end

When /^I rename jump type "(.+)" to "(.+)"$/ do |from_name, to_name|
  jump_type = JumpType.find_or_create_by_name(from_name)

  visit edit_jump_type_path(jump_type)
  fill_in "Name", :with => to_name
  click_button "Submit"
end
