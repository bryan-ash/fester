Given /^a (.+) payment (credits|debits) an account$/ do |method_name, account_effect|
  credit = (account_effect == 'credits')
  PaymentMethod.create! :name => method_name, :credit => credit
end

Given /^that no payment methods exist$/ do
  PaymentMethod.delete_all
end

Given /^there is a payment method named "(.*)"$/ do |payment_method|
  PaymentMethod.create! :name => payment_method
end

When /^I create a payment method named "(.+)"$/ do |name|
  When 'I go to the payment methods page'
  And  'I follow "New payment method"'
  And  'I fill in "Name" with "' + name + '"'
  And  'I press "Submit"'
end

When /^I rename payment method "(.+)" to "(.+)"$/ do |from, to|
  payment_method = PaymentMethod.find_or_create_by_name(from)

  visit edit_payment_method_path(payment_method)
  fill_in "Name", :with => to
  click_button "Submit"
end

