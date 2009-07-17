In order to know who owes what
As a Manifester
I want Fester to remember account information

  Background:
    Given I am logged in as Mani Fester

  Scenario: Creating a jumper
    Given that no accounts exist
    When  I create jumper "Johnny"
    Then  I should see "Johnny"
    And   I should see "Jumper"

  Scenario: Creating a jumping pilot
    Given that no accounts exist
    When  I create jumping pilot "Random"
    Then  I should see "Random"
    And   I should see "Jumper, Pilot"

  Scenario: Creating a non jumping pilot
    Given that no accounts exist
    When  I create pilot "Handsome Joe"
    Then  I should see "Handsome Joe"
    And   I should see "Pilot"
    And   I should not see "Jumper"

  Scenario Outline: Accounts have details
    Given that no accounts exist
    When  I create an account with <field> "<value>"
    Then  I should see "<value>"

  Examples:
  | field   | value               |
  | Email   | jane.doe@anytown.us |
  | Contact | 555-123-4567        |
  | Gender  | Female              |
  | DOB     | 04-04-1972          |

  Scenario: Account list is sorted by name
    When I create pilot "Peter"
    And  I create jumper "Johnny"
    Then Johnny should be listed above Peter on the accounts page
