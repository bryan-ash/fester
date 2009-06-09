In order to quickly manifest loads
As a Manifester
I want aircraft to be remembered

  Background:
    Given I am logged in as Mani Fester

  Scenario: No aircraft exist
    Given that no aircraft exist
    When  I create our aircraft "42Z" with 6 slots
    And   I go to the aircraft page
    Then  I should see "42Z"
    And   I should see "6"
    And   I should see "Yes"

  Scenario: An aircraft exist
    Given there is an aircraft named "visitor"
    When  I go to the aircraft page
    Then  I should see "visitor"
    And   I should not see "Yes"
    When  I follow "Edit"
    And   I check "Ours"
    And   I press "Submit"
    And   I go to the aircraft page
    Then  I should see "visitor"
    And   I should see "Yes"
