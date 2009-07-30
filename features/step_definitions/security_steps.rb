Given /^there is a user "(.+)"$/ do |user|
  visit '/users/new'
  fill_in 'username', :with => user
  fill_in 'email', :with => 'user@fester.com'
  fill_in 'password', :with => 'secret'
  fill_in 'password confirmation', :with => 'secret'
  click_button 'Create'
end

Given /^I am logged in as "(.+)"$/ do |user|
  Given 'there is a user "' + user + '"'

  visit '/login'
  fill_in 'username', :with => user
  fill_in 'password', :with => 'secret'
  click_button 'Submit'
  Then 'I should see "Successfully logged in."'
end

Given /^I am logged in as Mani Fester$/ do
  Given 'I am logged in as "Mani Fester"'
  User.find_by_username('Mani Fester').
    update_attribute :role, Role.find_by_name('Manager')
end

Given /^I am logged in as Bobby Basic$/ do
  Given 'I am logged in as "Bobby Basic"'
end

Given /^I am logged in$/ do
  Given 'I am logged in as Mani Fester'
end

Given /^I am logged out$/ do
  session = UserSession.find
  session.destroy if session
end

When /^I login$/ do
  Given 'I am logged in as Mani Fester'
end

When /^I login using my email address$/ do
  Given 'there is a user "Mani Fester"'
  And   'I am on the login page'
  When  'I fill in "Username/Email" with "user@fester.com"'
  And   'I press "Submit"'
end

When /^I logout$/ do
  visit 'logout'
end

When /^a div with id "injected" is entered into "Name"$/ do
  fill_in 'Name', :with => '<div id="injected">Hey!</div>'
end

Then /^I should know that I\'m logged in$/ do
  Then 'I should see "My Account"'
end

Then /^I should not see a div with id "injected"$/ do
  response.should_not have_selector('div', :id => 'injected')
end
