In order to quickly manifest loads
As a Manifester
I want jump types to be remembered

  Background:
    Given I am logged in as Mani Fester

  Scenario: No jump types exist
    Given that no jump types exist
    When  I create a jump type named "Hop and Pop"
    And   I go to the jump types page
    Then  I should see "Hop and Pop"

  Scenario: Editing a jump type
    Given there is a jump type named "Tandem"
    When  I rename jump type "Tandem" to "Super Jump"
    And   I go to the jump types page
    Then  I should see "Super Jump"

  Scenario: Jump type has a cost
    Given there is a jump type named "Tandem"
    And   a Tandem costs $200
    When  I go to the jump types page
    Then  I should see "200.00"
    