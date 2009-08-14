Feature: Password Management

  In order to protect account information
  As a dropzone manager
  I want password protection

  Scenario: Forgotten password
    Given I have forgotten my password
    When  I request a password reset
    Then  I should be sent a password reset email

    Given I click the first link in the email
    When  I provide a new password
    Then  I should know that I'm logged in
