Given /^there is a user "(.+)"$/ do |user|
  visit '/users/new'
  fill_in 'username', :with => user
  fill_in 'email', :with => 'user@fester.com'
  fill_in 'password', :with => 'secret'
  fill_in 'password confirmation', :with => 'secret'
  click_button 'Submit'
end

Given /^I am logged in as "(.+)"$/ do |user|
  visit '/logout'
  visit '/login'
  fill_in 'username', :with => user
  fill_in 'password', :with => 'secret'
  click_button 'Submit'
  Then 'I should see "Successfully logged in."'
end

Given /^(.+) is a (Manager|Manifester)$/ do |username, role_name|
  User.find_by_username(username).
    update_attribute :role, Role.find_by_name(role_name)
end

Given /^I am logged in as Mani Fester$/ do
  Given 'there is a user "Mani Fester"'
  And   'Mani Fester is a Manifester'
  And   'I am logged in as "Mani Fester"'
end

Given /^I am logged in as Maggie Manager$/ do
  Given 'there is a user "Maggie Manager"'
  And   'Maggie Manager is a Manager'
  And   'I am logged in as "Maggie Manager"'
end

Given /^I am logged in as Bobby Basic$/ do
  Given 'there is a user "Bobby Basic"'
  And   'I am logged in as "Bobby Basic"'
end

Given /^I am logged in$/ do
  Given 'I am logged in as Mani Fester'
end

Given /^I am logged out$/ do
  visit 'logout'
end

When /^I login$/ do
  Given 'I am logged in as Mani Fester'
end

When /^I login using my email address$/ do
  Given 'there is a user "Mani Fester"'
  And   'I am logged out'
  And   'I am on the login page'
  When  'I fill in "Username/Email" with "user@fester.com"'
  And   'I fill in "Password" with "secret"'
  And   'I press "Submit"'
end

When /^I logout$/ do
  Given 'I am logged out'
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
