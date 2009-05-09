Given /^there is a payment method named "(.+)"$/ do |method|
  PaymentMethod.create! :name => method
end
