Feature: Navigation

  In order to quickly access important information
  As a manifester
  I want links available

  Scenario Outline: Main functions
    Given I am on the home page
    When  I follow "<link>"
    Then  I should be on the <page> page

  Examples:
  | link         | page         |
  | Manifest     | loads        |
  | Transactions | transactions |
  | Accounts     | accounts     |

  Scenario Outline: Maintenance functions
    Given I am on the home page
    When  I follow "<link>"
    Then  I should be on the <page> page

  Examples:
  | link            | page            |
  | Aircraft        | aircraft        |
  | Jump Types      | jump types      |
  | Payment Methods | payment methods |
  | Equipment       | equipment       |
