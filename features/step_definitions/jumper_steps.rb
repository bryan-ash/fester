Given /^that no jumpers exist$/ do
  Jumper.delete_all
end

Given /^there is a jumper named "(.*)"$/ do |jumper|
  Jumper.create! :name => jumper
end

When /^I create jumper "Johnny Jumper"$/ do
  When 'I go to the jumpers page'
  And  'I follow "New jumper"'
  And  'I fill in "Name" with "Johnny Jumper"'
  And  'I press "Create"'
end
