In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Background:
    Given I am logged in as Mani Fester

  Scenario: Manifesting an AFF
    Given PENDING a way to enter values into a given slot on the load
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
    When  Sally Skydiver takes the slot
    Then  Sally Skydiver should be manifested for a Tandem on our aircraft "42Z"

  Scenario: Manifest on a visiting aircraft
    Given there is a jumper named "Bobby Bounce"
    And   there is a jump type named "Tandem"

    When  I go to the loads page
    And   I follow "New load"
    And   I fill in "Other" with "visitor"
    And   I select "Bobby Bounce" from "Jumper"
    And   I select "Tandem" from "Jump Type"
    And   I press "Submit"

    Then  Bobby Bounce should be manifested for a Tandem on other aircraft "visitor"
    When  I go to the loads page
    Then  I should see "visitor"

  Scenario: Editing a load on our aircraft
    Given a load manifested on our aircraft
    When  I edit the load
    Then  the "Other" field should be blank

  Scenario: A load has 6 slots by default
    Given I am on the loads page
    When  I follow "New load"
    Then  I should see 6 slots

  Scenario: Manifesting only creates transactions for filled slots
    Given that no transactions exist
    And   Jenny is manifested for a Fun Jump on 1EE
    When  I go to the transactions page
    Then  1 transaction should exist
