Feature: Transactions

  In Order to keep track of who owes what to whom
  As a dropzone office worker
  I want to enter transactions

  @focus
  Scenario: Jumper pays with cash
    Given there is a jumper named "Jane"
    When  I enter Jane's payment of $250 cash
    Then  Jane's balance should be $250.00
