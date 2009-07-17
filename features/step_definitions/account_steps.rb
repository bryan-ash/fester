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
  And  'I follow "New"'
  And  'I fill in "Name" with "' + jumper + '"'
  And  'I press "Submit"'
end

When /^I create jumping pilot "(.+)"$/ do |pilot|
  When 'I go to the accounts page'
  And  'I follow "New"'
  And  'I fill in "Name" with "' + pilot + '"'
  And  'I check "Pilot"'
  And  'I press "Submit"'
end

When /^I create pilot "(.+)"$/ do |pilot|
  When 'I go to the accounts page'
  And  'I follow "New"'
  And  'I fill in "Name" with "' + pilot + '"'
  And  'I check "Pilot"'
  And  'I uncheck "Jumper"'
  And  'I press "Submit"'
end

When /^I create an account with (.+) "(.+)"$/ do |field, value|
  When 'I go to the accounts page'
  And  'I follow "New"'
  And  'I fill in "' + field + '" with "' + value + '"'
  And  'I press "Submit"'
end

When /^I go to (.+)\'s page$/ do |name|
  account = Account.find_by_name name
  visit "/accounts/#{account.id}/edit"
end

Given /^I am on an account page$/ do
  Given 'there is a jumper named "Julia"'
  And   'I go to Julia\'s page'
end

Then /^(.+)\'s balance should be (.+)$/ do |name, amount|
  account = Account.find_by_name(name)
  visit edit_account_path(account)
  response.body.should contain(amount)
end

