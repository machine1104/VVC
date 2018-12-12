Feature: Logout
  As a registered user
  I want to logout
  So that I close the session

  Scenario: Logout successfully
    Given I am a registered user logged in
    When I click on logout link
    Then I am not authenticated verifica