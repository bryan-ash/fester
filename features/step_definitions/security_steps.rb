Given /^I am logged in as (.+)$/ do |user|
  visit '/users/new'
  fill_in 'username', :with => user
  fill_in 'email', :with => 'user@fester.com'
  fill_in 'password', :with => 'secret'
  fill_in 'password confirmation', :with => 'secret'
  click_button 'Create'
  
  visit '/login'
  fill_in 'username', :with => user
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

Then /^I should know that I\'m logged in$/ do
  Then 'I should see "Mani Fester"'
end

Then /^I should not see a div with id "injected"$/ do
  response.should_not have_selector('div', :id => 'injected')
end
