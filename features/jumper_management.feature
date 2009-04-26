In order to TBD
As a Manifester
I want Fester to remember jumper's information

  Scenario: No jumpers exist
    Given that no jumpers exist
    When I create jumper "Johnny Jumper"
    Then I should see "Jumpers"
    And I should see "Johnny Jumper"
