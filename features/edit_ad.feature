Feature: Edit Announcement
  As a registered user
  I want to edit my announcement
  So that I can update it

  Scenario: Edit
    Given I am a registered user logged in
    And I have an announcement
    And I am on the modifica annuncio page
    When I edit my announcement
    And I click on Aggiorna button
    Then Announcement should be updated
    
    
