Given /^that no transactions exist$/ do
  Transaction.delete_all
end

When /^I enter (.+)\'s (.+) payment of \$(.+)$/ do |name, method, amount|
  Given 'I am on the new transaction page'
  When  'I select "' + name + '" from "Account"'
  And   'I select "' + method + '" from "Method"'
  And   'I fill in "Amount" with "' + amount + '"'
  And   'I fill in "Notes" with "payment"'
  And   'I press "Submit"'
end

Then /^I should see an entry for (.+)\'s (.+)$/ do |jumper, jump_type|
  Then "I should see \"#{jumper}\""
  And  "I should see \"#{jump_type}\""
end

Then /^1 transaction should exist$/ do
  Transaction.count.should == 1
end
