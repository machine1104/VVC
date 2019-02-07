Feature: Edit Announcement
  As a registered user
  I want to edit my announcement
  So that I can update it

  Scenario: Edit succesfully
    Given I am a registered user logged in
    And I have an announcement
    And I am on the modifica annuncio page
    When I edit my announcement with valid informations
    And I click on Aggiorna button
    Then Announcement should be updated

  Scenario: Edit unsuccesfully
    Given I am a registered user logged in
    And I have an announcement
    And I am on the modifica annuncio page
    When I edit my announcement with invalid informations
    And I click on Aggiorna button
    Then Announcement should not be updated
    
    
