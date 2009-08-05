Feature: Authorization

  In order to keep control of the business
  As a dropzone owner
  I want to limit access to editing of business data

  Scenario Outline: Nothing is available unless logged in
    When I go to the <protected> page
    Then I should be on the home page
    And  the "Login" link should be visible

  Examples:
  | protected    |
  | accounts     |
  | aircrafts    |
  | manifest     |
  | transactions |

  Scenario Outline: Basic user has limited access
    Given I am logged in as Bobby Basic
    When  I go to the home page
    Then  the "<name>" link should not be visible

  Examples:
  | name         |
  | Manifest     |
  | Transactions |
  | Accounts     |
  | Management   |

  Scenario Outline: Manager has access to everything
    Given I am logged in as Maggie Manager
    When  I go to the home page
    Then  the "<name>" link should be visible

  Examples:
  | name         |
  | Manifest     |
  | Transactions |
  | Accounts     |
  | Management   |
