Feature: Authorization

  In order to keep control of the business
  As a dropzone owner
  I want to limit access to editing of business data

  Scenario Outline: Nothing is available unless logged in
    Given I am logged out
    When  I go to the <protected> page
    Then  I should be on the home page
    And   the "Login" link should be visible

  Examples:
  | protected       |
  | accounts        |
  | aircrafts       |
  | manifest        |
  | transactions    |
  | edit my profile |

  Scenario: Updating a user profile isn't allowed unless logged in
    Given I am logged out
    When  I update the current user profile
    Then  I should be on the home page

  Scenario Outline: Default user role has very restricted access
    Given I am logged in as Bobby Basic
    When  I go to the <protected> page
    Then  I should be on the edit my profile page

  Examples:
  | protected    |
  | accounts     |
  | aircrafts    |
  | manifest     |
  | transactions |

  Scenario Outline: Manager user role has unrestricted access
    Given I am logged in as Maggie Manager
    When  I go to the <protected> page
    Then  I should be on the <protected> page

  Examples:
  | protected    |
  | accounts     |
  | aircrafts    |
  | manifest     |
  | transactions |
