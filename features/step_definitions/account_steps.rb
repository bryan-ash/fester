Given /^that no accounts exist$/ do
  Account.delete_all
end

Given /^there is a jumper named "(.*)"$/ do |jumper|
  Account.create! :name => jumper
end

Given /^there is a pilot named "(.*)"$/ do |pilot|
  Account.create! :name => pilot, :pilot => true
end

When /^I create jumper "(.+)"$/ do |jumper|
  When 'I go to the accounts page'
  And  'I follow "New account"'
  And  'I fill in "Name" with "' + jumper + '"'
  And  'I press "Submit"'
end

When /^I create jumping pilot "(.+)"$/ do |pilot|
  When 'I go to the accounts page'
  And  'I follow "New account"'
  And  'I fill in "Name" with "' + pilot + '"'
  And  'I check "Pilot"'
  And  'I press "Submit"'
end

When /^I create pilot "(.+)"$/ do |pilot|
  When 'I go to the accounts page'
  And  'I follow "New account"'
  And  'I fill in "Name" with "' + pilot + '"'
  And  'I check "Pilot"'
  And  'I uncheck "Jumper"'
  And  'I press "Submit"'
end

Then /^(.+)\'s balance should be (.+)$/ do |name, amount|
  account = Account.find_by_name(name)
  visit edit_account_path(account)
  response.body.should contain(amount)
end
