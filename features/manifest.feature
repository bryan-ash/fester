In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Scenario: Manifesting an AFF
    Given there are no loads manifested
    And   we own an aircraft named "42Z"
    And   there is a jumper named "Johnny Jumper"
    And   there is a pilot named "Polly"
    And   there is a jump type named "AFF"
    And   there is equipment named "Wing Suit"
    When  I go to the loads page
    And   I follow "New load"
    And   I choose "42Z"
    And   I select "Polly" from "Pilot"
    And   I select "Johnny Jumper" from "Jumper"
    And   I select "AFF" from "Jump Type"
    And   I fill in "Altitude" with "11000"
    And   I select "Wing Suit" from "Equipment"
    And   I fill in "Cost" with "123.45"
    And   I fill in "Notes" with "Level 4"
    And   I press "Submit"
    Then  I should see "success"
    And   I should see "42Z"
    And   I should see "Polly"
    And   I should see "Johnny Jumper"
    And   I should see "AFF"
    And   I should see "Wing Suit"
    And   I should see "Level 4"
    And   I should see "11000"
    And   I should see "123.45"
    When  I go to the loads page
    Then  I should see "42Z"

  Scenario: Change a jumper in a given slot
    Given Johnny Jumper is manifested for a Tandem on 42Z
    And   there is a jumper named "Sally Skydiver"
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
    Then  the "Other" field should contain "visitor"
    And   "visitor" should not be a radio button

  Scenario: Editing a load on our aircraft
    Given a load manifested on our aircraft
    When  I edit the load
    Then  the "Other" field should be blank
