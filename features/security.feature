In order to keep only the truth stored
As a dropzone owner
I want malicious attack protection

  Background:
    Given I am logged in as Mani Fester

  Scenario: Inputs are sanitized
    Given I am on an account page
    When  a div with id "injected" is entered into "Name"
    And   I press "Submit"
    Then  I should not see a div with id "injected"