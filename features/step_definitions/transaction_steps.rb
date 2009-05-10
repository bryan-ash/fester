When /^I enter (.+)\'s (.+) payment of \$(.+)$/ do |name, method, amount|
  Given 'I am on the new transaction page'
  When  'I select "' + name + '" from "Account"'
  And   'I select "' + method + '" from "Method"'
  And   'I fill in "Amount" with "' + amount + '"'
  And   'I fill in "Notes" with "payment"'
  And   'I press "Submit"'
end
