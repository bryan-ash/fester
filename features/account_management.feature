In order to know who owes what
As a Manifester
I want to remember account information

  Background:
    Given I am logged in as Mani Fester

  Scenario: Creating a jumper
    Given that no accounts exist
    When  I create jumper "Johnny"
    And   I go to Johnny's page
    Then  I should see "Johnny"
    And   I should see "Jumper"

  Scenario: Creating a jumping pilot
    Given that no accounts exist
    When  I create jumping pilot "Random"
    And   I go to Random's page
    Then  I should see "Random"
    And   I should see "Jumper, Pilot"

  Scenario: Creating a non jumping pilot
    Given that no accounts exist
    When  I create pilot "Handsome Joe"
    And   I go to Handsome Joe's page
    Then  I should see "Handsome Joe"
    And   I should see "Pilot"
    And   I should not see "Jumper"

  Scenario Outline: Accounts have details
    Given that no accounts exist
    When  I create Jane's account with <field> "<value>"
    And   I go to Jane's page
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

  Scenario: Initial balance can be entered for a new account
    Given that no accounts exist
    When  I create Julia's account with an initial balance of $40
    Then  Julia's balance should be $40

  Scenario: Accounts are searchable
    Given I create jumper "July"
    And   I create jumper "Julia"
    And   I create jumper "Jane"
    When  I search accounts for "Jane"
    Then  I should see "Jane"
    And   I should not see "July"
    And   I should not see "Julia"

  Scenario: The account list shows balances
    Given I create Julia's account with an initial balance of $400
    When  I go to the accounts page
    Then  I should see "400.00"

  Scenario: Jumper's transactions are listed on their account page
    Given PENDING a way to enter values into a given slot on the load
    Given Julia is manifested for a Fun Jump on our aircraft "1EE"
    And   a cash payment credits an account
    And   I enter Julia's cash payment of $20

    When  I go to Julia's page
    Then  I should see "Fun Jump"
    And   I should see "cash"
    And   I should see "20.0"

  Scenario: Slot transaction links back to the load
    Given Julia is manifested for a Fun Jump on our aircraft "1EE"
    When  I go to Julia's page
    And   I follow "Load 1"
    Then  I should see "Editing Load 1"

  Scenario: Slot transactions do not link to transaction edit page
    Given Julia is manifested for a Fun Jump on our aircraft "1EE"
    When  I go to Julia's page
    Then  "date" should not be a link
    And   "amount" should not be a link

  Scenario: Transaction links to transaction edit page
    Given a cash payment credits an account
    And   I enter Julia's cash payment of $20
    When  I go to Julia's page
    And   I follow "date"
    Then  I should be editing Julia's transaction

    When  I go to Julia's page
    And   I follow "amount"
    Then  I should be editing Julia's transaction
