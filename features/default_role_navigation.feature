Feature: Default Role Navigation

  In order to quickly access important information
  As a default user
  I want links available

  Scenario: Logging in presents the entry page
    Given I am logged in as Bobby Basic
    Then I should be on the edit my profile page

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

