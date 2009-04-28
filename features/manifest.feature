In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Scenario: No loads manifested
    Given there are no loads manifested
    And   there is an aircraft named "42Z"
    And   there is a jumper named "Johnny Jumper"
    When  I go to the loads page
    And   I follow "New load"
    And   I select "42Z" from "Aircraft"
    And   I select "Johnny Jumper" from "Jumper"
    And   I press "Create"
    Then  I should see "success"
    And   I should see "42Z"
    And   I should see "Johnny Jumper"
    When  I go to the loads page
    Then  I should see "42Z"
