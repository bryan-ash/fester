Given /^that no accounts exist$/ do
  Account.delete_all
end

Given /^there is a jumper named "(.*)"$/ do |jumper|
  Account.create! :name => jumper
end

Given /^there is a pilot named "(.*)"$/ do |pilot|
  Account.create! :name => pilot, :pilot => true
end

Given /^I am on an account page$/ do
  Given 'there is a jumper named "Julia"'
  And   'I go to Julia\'s edit page'
end

When /^I create (.+)\'s account with an initial balance of \$(\d+)$/ do |jumper, balance|
  When 'I go to the accounts page'
  And  'I follow "New"'
  And  'I fill in "Name" with "' + jumper + '"'
  And  'I fill in "Balance adjustment" with "' + balance + '"'
  And  'I press "Submit"'
  Then 'I should be on the accounts page'
end

When /^I register as (.+) with an email of (.+)$/ do |jumper, email|
  When 'I go to the registration page'
  And  'I fill in "Username" with "' + jumper + '"'
  And  'I fill in "Email" with "' + email + '"'
  And  'I fill in "Password" with "Secret"'
  And  'I fill in "Password confirmation" with "Secret"'
  And  'I press "Create"'
end

When /^I create jumper "(.+)"$/ do |jumper|
  When "I create #{jumper}'s account with an initial balance of $0"
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

When /^I create Jane\'s account with (.+) "(.+)"$/ do |field, value|
  When 'I go to the accounts page'
  And  'I follow "New"'
  And  'I fill in "Name" with "Jane"'
  And  'I fill in "' + field + '" with "' + value + '"'
  And  'I press "Submit"'
end

When /^I go to (.+)\'s page$/ do |name|
  account = Account.find_by_name name
  visit account_path(account)
end

When /^I go to (.+)\'s edit page$/ do |name|
  account = Account.find_by_name name
  visit edit_account_path(account)
end

When /^I search accounts for "Jane"$/ do 
  Given 'I am on the accounts page'
  When  'I fill in "search" with "Jane"'
  And   'I press "Search"'
end

Then /^(.+)\'s balance should be (.+)$/ do |name, amount|
  account = Account.find_by_name(name)
  visit edit_account_path(account)
  response.body.should contain(amount)
end

