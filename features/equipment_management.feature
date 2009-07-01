In order to rent equipment to jumpers
As a Manifester
I want Fester to remember equipment information

  Background:
    Given I am logged in as Mani Fester

  Scenario: Creating equipment
    Given that no equipment exists
    When  I create equipment "Shiny gear"
    Then  I should see "Shiny gear"

  Scenario: Deleting equipment
    Given there is equipment named "Shiny gear"
    When  I delete "Shiny gear"
    Then  "Shiny gear" should no longer be available
