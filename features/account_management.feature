In order to know who owes what
As a Manifester
I want Fester to remember account information

    @focus
  Scenario: Creating a jumper
    Given that no accounts exist
    When  I create jumper "Johnny"
    Then  I should see "Johnny"
    And   I should see "Jumper"

    @focus
  Scenario: Creating a jumping pilot
    Given that no accounts exist
    When  I create jumping pilot "Random"
    Then  I should see "Random"
    And   I should see "Jumper, Pilot"

    @focus
  Scenario: Creating a non jumping pilot
    Given that no accounts exist
    When  I create pilot "Handsome Joe"
    Then  I should see "Handsome Joe"
    And   I should see "Pilot"
    And   I should not see "Jumper"