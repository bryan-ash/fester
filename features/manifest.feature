In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Scenario: No loads manifested
    Given there are no loads manifested
    And   there is an aircraft named "42Z"
    When  I go to the loads page
    And   I follow "New load"
    And   I select "42Z" from "Aircraft"
    