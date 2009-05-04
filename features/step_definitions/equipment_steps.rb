Given /^there is equipment named "(.*)"$/ do |equipment|
  Equipment.create! :name => equipment
end
