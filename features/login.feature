Feature: Login
  As a registered user
  I want to login into the system
  So that I can use all services

  Scenario: Login successfully
    Given I am a registered user
    And I am not authenticated
    And I am on the login page
    And I insert valid credentials
    When I click on login button
    Then I am authenticated
