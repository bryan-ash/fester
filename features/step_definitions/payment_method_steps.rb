Given /^a (.+) payment (credits|debits) an account$/ do |method_name, account_effect|
  credit = (account_effect == 'credits')
  PaymentMethod.create! :name => method_name, :credit => credit
end

