Feature: Manifester Navigation

  In order to quickly access important information
  As a manifester
  I want links available

  Background:
    Given I am logged in as Mani Fester

  Scenario: Returning home once logged in takes you to the entry page
    When I go to the home page
    Then I should be on the loads page

    When I go to the login page
    Then I should be on the loads page

  Scenario Outline: Main functions are available from home page
    Given I am on the home page
    When  I follow "<link>"
    Then  I should be on the <page> page

  Examples:
  | link         | page         |
  | Manifest     | loads        |
  | Transactions | transactions |
  | Accounts     | accounts     |

  Scenario Outline: Management functions
    Given I am looking at the management features
    When  I follow "<link>"
    Then  I should be on the <page> page

  Examples:
  | link            | page            |
  | Aircraft        | aircraft        |
  | Jump Types      | jump types      |
  | Payment Methods | payment methods |
  | Equipment       | equipment       |
  | Import CSV      | CSV import      |

  Scenario Outline: My Account function
    Given I am looking at My Account
    When  I follow "<link>"
    Then  I should be on the <page> page

  Examples:
  | link         | page            |
  | Edit Profile | edit my profile |
  | Logout       | home            |
