In order to track customer's jumps
As a Manifester
I want Fester to remember who jumped

  Background:
    Given I am logged in as Mani Fester

  Scenario: Manifesting an AFF
    Given PENDING a way to enter values into a given slot on the load
    Given Johnny Jumper is manifested for an AFF on our aircraft "42Z"
    Then  Johnny Jumper should be manifested for an AFF on our aircraft "42Z"

  Scenario: Change a jumper in a given slot
    Given PENDING a way to enter values into a given slot on the load
    Given Johnny Jumper is manifested for a Tandem on our aircraft "42Z"
    When  Sally Skydiver takes the slot
    Then  Sally Skydiver should be manifested for a Tandem on our aircraft "42Z"

  Scenario: Manifest on a visiting aircraft
    Given Bobby Bounce is manifested for an AFF on other aircraft "visitor"
    Then  Bobby Bounce should be manifested for a Tandem on other aircraft "visitor"

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
    When  Jenny is manifested for a Fun Jump on our aircraft "1EE"
    Then  1 transaction should exist

  Scenario: Fixing bug that created additional transactions when editing a load
    Given that no transactions exist
    And   Jenny is manifested for a Fun Jump on our aircraft "1EE"
    When  I edit the load
    And   I press "Submit"
    Then  1 transaction should exist
