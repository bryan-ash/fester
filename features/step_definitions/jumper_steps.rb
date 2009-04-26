Given /^that no jumpers exist$/ do
  Jumper.delete_all
end

When /^I create jumper "Johnny Jumper"$/ do
  When 'I go to the jumpers page'
  And  'I follow "New jumper"'
  And  'I fill in "Name" with "Johnny Jumper"'
  And  'I press "Create"'
end
