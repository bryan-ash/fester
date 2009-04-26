In order to quickly manifest loads
As a Manifester
I want aircraft to be remembered

  Scenario: No aircraft exist
    Given that no aircraft exist
    When  I create aircraft "42Z" with 6 slots
    And   I go to the aircraft page
    Then  I should see "Aircraft"
    And   I should see "42Z"
