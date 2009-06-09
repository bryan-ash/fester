Feature: Authorization

  In order to keep control of the business
  As a dropzone owner
  I want to limit access to editing of business data

  Scenario Outline: Nothing is available unless logged in
    When I go to the <protected> page
    Then I should be on the home page

  Examples:
  | protected    |
  | accounts     |
  | aircrafts    |
  | manifest     |
  | transactions |
