Given /^I have forgotten my password$/ do
  Given 'I register as Jenny with an email of Jenny@jumper.com'
  Given 'I am on the login page'
  And   'I follow "Lost Username or Password"'
end

When /I request a password reset/ do
  When  'I fill in "Email" with "Jenny@jumper.com"'
  And   'I press "Submit"'
  Then  'I should see "sent"'
  And   'I should be on the home page'
end

When /^I provide a new password$/ do
  When 'I fill in "Password" with "secret"'
  And  'I fill in "Password confirmation" with "secret"'
  And  'I press "Update my password and log me in"'
end

Then /^I should be sent a password reset email$/ do
  Given '"Jenny@jumper.com" should have 1 email'
  When  'I open the email'
  Then  'I should see "Fester Password Reset Instructions" in the subject'
end
