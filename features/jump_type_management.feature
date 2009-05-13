In order to quickly manifest loads
As a Manifester
I want jump types to be remembered

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
