Feature: Edit Profile
  As a registered user
  I want to edit my profile
  So that I can update it

  Scenario: Edit successfully
    Given I am a registered user logged in
    And I am on the edit page
    When I edit my profile
    And I click on Aggiorna button
    Then Profile should be updated
    
    
