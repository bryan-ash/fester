Feature: Transaction Searching

  In order to quickly see what information is entered
  As a dropzone office worker
  I want to search transactions

  Background:
    Given I am logged in as Mani Fester

  Scenario: Transactions are searchable by account name
    Given I create Julia's account with an initial balance of $40
    Given I create Johnny's account with an initial balance of $70
    When  I search transactions for account "Johnny"
    Then  I should see "Johnny"
    And   I should not see "Julia"

  Scenario: Transactions are searchable by payment method
    Given I enter Pete's payroll payment of $250
    And   a cash payment credits an account  
    And   I enter Jimmy's cash payment of $300
    When  I search transactions for payment method "cash"
    Then  I should see "Jimmy"
    And   I should not see "Pete"

  Scenario: Transactions are searchable by payment method
    When  I search transactions for account "That doesn't exist"
    Then  I should see "No transactions found that matched the search criteria"
