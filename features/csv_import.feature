Feature: CSV import

  In order to make use of existing data
  As a Manifester
  I want to import data from CSV files

  Background:
    Given I am logged in as Mani Fester

  Scenario: Importing a valid file with data for 3 new accounts
    When  I import a file with valid data for 3 new accounts
    Then  the accounts should be imported
    And   I should be on the accounts page

  Scenario: Importing when users already exist
    Given an account to be imported already exists
    When  I import a file with valid data for 3 new accounts
    Then  only the new accounts should be imported

