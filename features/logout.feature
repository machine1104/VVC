Feature: Logout
  As a registered user
  I want to logout
  So that I close the session

  Scenario: Logout successfully
    Given I am a registered user
    And I am authenticated
    When I click on Logout button
    Then I am not authenticated