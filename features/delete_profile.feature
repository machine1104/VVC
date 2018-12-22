Feature: Delete Profile
  As a registered user
  I want to delete my profile
  So that I'm not on the database anymore

  Scenario: Delete
    Given I am a registered user logged in
    And I am on the edit page
    When I click on Delete account button
    Then Profile should be deleted
  
    