In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Scenario: No loads manifested
    Given there are no loads manifested
    And   there is an aircraft named "42Z"
    And   there is a jumper named "Johnny Jumper"
    When  I go to the loads page
    And   I follow "New load"
    And   I fill in "Aircraft" with "42Z"
    And   I select "Johnny Jumper" from "Jumper"
    And   I press "Submit"
    Then  I should see "success"
    And   I should see "42Z"
    And   I should see "Johnny Jumper"
    When  I go to the loads page
    Then  I should see "42Z"

  Scenario: Change a jumper in a given slot
    Given there is an aircraft named "42Z"
    And   there is a jumper named "Johnny Jumper"
    And   there is a jumper named "Sally Skydiver"
    And   "Johnny Jumper" is manifested on "42Z"
    When  I go to the loads page
    And   I follow "Edit"
    And   I select "Sally Skydiver" from "Jumper"
    And   I press "Submit"
    Then  I should see "success"
    And   I should see "42Z"
    And   I should see "Sally Skydiver"
    When  I go to the loads page
    Then  I should see "42Z"
    
    