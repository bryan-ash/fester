Given /^that no transactions exist$/ do
  Transaction.delete_all
end

When /^I enter (.+)\'s (.+) payment of \$(.+)$/ do |name, method, amount|
  Given 'I am on the new transaction page'
  When  'I fill in "Account" with "' + name + '"'
  And   'I select "' + method + '" from "Method"'
  And   'I fill in "Amount" with "' + amount + '"'
  And   'I fill in "Notes" with "payment"'
  And   'I press "Submit"'
  Then  'I should be on the transactions page'
end

When /^I change Julia\'s payment to \$40$/ do
  Given 'I am on the transactions page'
  When  'I follow "edit"'
  And   'I fill in "Amount" with "40"'
  And   'I press "Submit"'
  Then  'I should be on the transactions page'
end

Then /^I should see an entry for (.+)\'s (.+)$/ do |jumper, jump_type|
  Then "I should see \"#{jumper}\""
  And  "I should see \"#{jump_type}\""
end

Then /^1 transaction should exist$/ do
  Transaction.count.should == 1
end

Then /^the transaction should not be deletable$/ do
  Then 'I should not see "Delete"'
end

Then /^the transaction should not be editable$/ do
  Then 'I should not see "Edit"'
end
