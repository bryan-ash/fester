Feature: Authentication

  Scenario: Successful login
    When  I login
    Then  I should know that I'm logged in

  Scenario: Login using email address
    When  I login using my email address
    Then  I should know that I'm logged in

  Scenario: Logging out
    Given I am logged in
    When  I logout
    Then  I should be on the home page

  Scenario: Logging out when not logged in
    Given I am logged out
    When  I logout
    Then  I should be on the home page