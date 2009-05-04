In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Scenario: No loads manifested
    Given there are no loads manifested
    And   we own an aircraft named "42Z"
    And   there is a jumper named "Johnny Jumper"
    And   there is a jump type named "AFF"
    When  I go to the loads page
    And   I follow "New load"
    And   I choose "42Z"
    And   I select "Johnny Jumper" from "Jumper"
    And   I select "AFF" from "Jump Type"
    And   I fill in "Notes" with "Level 4"
    And   I press "Submit"
    Then  I should see "success"
    And   I should see "42Z"
    And   I should see "Johnny Jumper"
    And   I should see "AFF"
    And   I should see "Level 4"
    When  I go to the loads page
    Then  I should see "42Z"

  Scenario: Change a jumper in a given slot
    Given we own an aircraft named "42Z"
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
    
  Scenario: Manifest on a visiting aircraft
    Given there is a jumper named "Bobby Bounce"
    When  I go to the loads page
    And   I follow "New load"
    And   I fill in "Other" with "visitor"
    And   I select "Bobby Bounce" from "Jumper"
    And   I press "Submit"
    Then  I should see "success"
    And   I should see "visitor"
    And   I should see "Bobby Bounce"
    When  I go to the loads page
    Then  I should see "visitor"
    When  I follow "Edit"
    Then  "visitor" should not be a radio button
