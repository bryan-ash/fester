When /^I enter (.+)\'s payment of \$(.+) cash$/ do |name, amount|
  acount = Account.find_by_name name

  Given 'there is a payment method named "Cash"'
  And   'I am on the new transaction page'
  When  'I select "' + name + '" from "Account"'
  And   'I select "Cash" from "Method"'
  And   'I fill in "Amount" with "' + amount + '"'
  And   'I fill in "Notes" with "payment"'
  And   'I press "Submit"'
end
