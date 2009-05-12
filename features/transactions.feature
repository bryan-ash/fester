Feature: Transactions

  In Order to keep track of who owes what to whom
  As a dropzone office worker
  I want to have a history of transactions

  Scenario: Jumper pays with cash
    Given there is a jumper named "Jane"
    And   a cash payment credits an account
    When  I enter Jane's cash payment of $250
    And   Jane's balance should be $250.00

  Scenario: Pilot gets paid
    Given there is a pilot named "Pete"
    And   a payroll payment debits an account
    When  I enter Pete's payroll payment of $250
    Then  Pete's balance should be $-250.00

  Scenario: Account names are visible on the transactions page
    Given there is a jumper named "Jane"
    And   a cash payment credits an account
    When  I enter Jane's cash payment of $250
    And   I go to the transactions page
    Then  I should see "Jane"

  Scenario: Payment method names are visible on the transactions page
    Given there is a jumper named "Jane"
    And   a cash payment credits an account
    When  I enter Jane's cash payment of $250
    And   I go to the transactions page
    Then  I should see "cash"

  Scenario: Jumper's slot creates a transaction
    Given Jenifer is manifested for a Tandem on 42Z
    When  I go to the transactions page
    Then  I should see an entry for Jenifer's Tandem
