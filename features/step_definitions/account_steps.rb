Given /^that no accounts exist$/ do
  Account.delete_all
end

Given /^there is a jumper named "(.*)"$/ do |jumper|
  Account.create! :name => jumper
end

Given /^there is a pilot named "(.*)"$/ do |pilot|
  Account.create! :name => pilot, :pilot => true
end

When /^I create account "Johnny Jumper"$/ do
  When 'I go to the accounts page'
  And  'I follow "New account"'
  And  'I fill in "Name" with "Johnny Jumper"'
  And  'I press "Submit"'
end
