Feature: Manager Navigation

  In order to quickly access important information
  As a manager
  I want links available

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
