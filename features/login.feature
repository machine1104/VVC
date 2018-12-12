Feature: Login
  As a registered user
  I want to login into the system
  So that I can use all services

  Scenario: Login successfully
    Given I am a registered user
    And I am not authenticated
    And I am on the login page
    And I insert valid credentials for login
    When I click on Log in button
    Then I am authenticated

  Scenario: Login unsuccessfully
    Given I am a registered user
    And I am not authenticated
    And I am on the login page
    And I insert invalid credentials for login
    When I click on Log in button
    Then I fail login