In order to quickly manifest loads
As a Manifester
I want payment methods to be remembered

  Background:
    Given I am logged in as Mani Fester

  Scenario: No payment methods exist
    Given that no payment methods exist
    When  I create a "Credit" payment method named "Cash"
    Then  I should see "Cash"
    And   I should see "Credit"

  Scenario: Editing a payment method
    Given there is a payment method named "Misc Debit"
    When  I rename payment method "Misc Debit" to "Misc Charge"
    Then  I should see "Misc Charge"
    And   I should see "Debit"