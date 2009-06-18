
Feature: Authentication

  Scenario: Successful login
    Given I am on the home page
    When  I login
    Then  I should be on the entry page

  Scenario: Logging 
    Given I am logged in
    When  I logout
    Then  I should be on the home page