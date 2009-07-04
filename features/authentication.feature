
Feature: Authentication

  Scenario: Successful login
    When  I login
    Then  I should be on the entry page
    And   I should know that I'm logged in

  Scenario: Logging 
    Given I am logged in
    When  I logout
    Then  I should be on the home page