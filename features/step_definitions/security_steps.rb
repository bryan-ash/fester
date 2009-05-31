When /^a div with id "injected" is entered into "Name"$/ do
  fill_in 'Name', :with => '<div id="injected">Hey!</div>'
end

Then /^I should not see a div with id "injected"$/ do
  lambda { div_with_id('injected') }.should raise_error('Could not find div with id "injected"')
end
