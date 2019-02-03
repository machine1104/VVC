Feature: Login link
  As an user
  I want to click on login
  So that I can login

  Scenario: Login
    Given I am on the announcements page
    When I click on login link
    Then I should be on login page