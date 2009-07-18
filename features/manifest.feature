Feature: Manifesting

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
    Then  Bobby Bounce should be manifested for an AFF on other aircraft "visitor"

  Scenario: Editing a load on our aircraft
    Given a load manifested on our aircraft
    When  I edit the load
    Then  the "Other" field should be blank

  Scenario: A load has 6 slots by default
    Given I am on the loads page
    When  I follow "New"
    Then  I should see 6 slots

  Scenario: Manifesting only creates transactions for filled slots
    Given that no transactions exist
    When  Jenny is manifested for a Fun Jump on our aircraft "1EE"
    Then  1 transaction should exist

  Scenario: Editing a load does not create additional transactions (bug)
    Given that no transactions exist
    And   Jenny is manifested for a Fun Jump on our aircraft "1EE"
    When  I edit the load
    And   I press "Submit"
    Then  1 transaction should exist

  Scenario: The cost for a jump type is used for the cost of the slot
    Given a Tandem costs $200
    When  July is manifested for a Tandem on our aircraft "1EE"
    Then  July's balance should be -$200

  Scenario: Creating Load 1
    Given there are no loads manifested
    When  I go to the new load page
    Then  I should see "Creating load 1"

  Scenario: Editing Load 1
    Given Johnny is manifested for an AFF on other aircraft "visitor"
    When  I follow "Edit"
    Then  I should see "Editing load 1"

  Scenario: Creating Load 2
    Given Johnny is manifested for an AFF on other aircraft "visitor"
    When  I go to the new load page
    Then  I should see "Creating load 2"

  Scenario: Loads are listed newest first
    Given Johnny is manifested for an AFF on other aircraft "visitor"
    And   Jenny is manifested for a Fun Jump on our aircraft "1EE"    
    Then  load 1 is on "visitor"
    And   load 2 is on "1EE"
    And   1EE should be listed above visitor on the loads page

  Scenario: Load numbers restart every day
    Given a load was manifested yesterday
    And   a load is manifested today
    Then  today's load should be load 1
    And   today's load should be listed above yesterday's
