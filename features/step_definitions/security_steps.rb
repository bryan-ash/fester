Given /^I am logged in as Mani Fester$/ do
  visit '/users/new'
  fill_in 'username', :with => 'Mani Fester'
  fill_in 'email', :with => 'mani@fester.com'
  fill_in 'password', :with => 'secret'
  fill_in 'password confirmation', :with => 'secret'
  click_button 'Create'
  
  visit '/login'
  fill_in 'username', :with => 'Mani Fester'
  fill_in 'password', :with => 'secret'
  click_button 'Submit'
  Then 'I should see "Successfully logged in."'
end

Given /^I am logged in$/ do
  Given 'I am logged in as Mani Fester'
end

When /^I login$/ do
  Given 'I am logged in as Mani Fester'
end

When /^I logout$/ do
  visit 'logout'
end

When /^a div with id "injected" is entered into "Name"$/ do
  fill_in 'Name', :with => '<div id="injected">Hey!</div>'
end

Then /^I should not see a div with id "injected"$/ do
  response.should_not have_selector('div', :id => 'injected')
end
