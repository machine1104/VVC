Feature: Edit Profile
  As a registered user
  I want to create an announcement
  So that I can sell my stuff

  Scenario: Create Announcement
    Given I am a registered user logged in
    And I am on the new announcement page
    And I insert valid announcement informations
    When I click on Crea annuncio button
    Then Announcement should be created
    
    