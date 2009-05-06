In order to know who owes what
As a Manifester
I want Fester to remember account information

  Scenario: No accounts exist
    Given that no accounts exist
    When  I create account "Johnny Jumper"
    Then  I should see "Johnny Jumper"
