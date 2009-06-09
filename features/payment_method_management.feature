In order to quickly manifest loads
As a Manifester
I want payment methods to be remembered

  Background:
    Given I am logged in as Mani Fester

  Scenario: No payment methods exist
    Given that no payment methods exist
    When  I create a payment method named "Payroll"
    And   I go to the payment methods page
    Then  I should see "Payroll"

  Scenario: Editing a payment method
    Given there is a payment method named "Cash"
    When  I rename payment method "Cash" to "Mular"
    And   I go to the payment methods page
    Then  I should see "Mular"
