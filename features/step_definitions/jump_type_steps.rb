Given /^that no jump types exist$/ do
  JumpType.delete_all
end

Given /^there is a jump type named "(.*)"$/ do |jump_type|
  JumpType.create! :name => jump_type
end

When /^I create a jump type named "(.+)"$/ do |name|
  When 'I go to the jump types page'
  And  'I follow "New jump type"'
  And  'I fill in "Name" with "' + name + '"'
  And  'I press "Submit"'
end

When /^I rename "(.+)" to "(.+)"$/ do |from, to|
  jump_type = JumpType.find_or_create_by_name(from)

  visit edit_jump_type_path(jump_type)
  fill_in "Name", :with => to
  click_button "Submit"
end

