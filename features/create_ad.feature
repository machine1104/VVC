Feature: Create announcement
  As a registered user
  I want to create an announcement
  So that I can sell my stuff

  Scenario: Announcement created successfully
    Given I am a registered user logged in
    And I am on the new announcement page
    And I insert valid announcement informations
    When I click on Crea annuncio button
    Then Announcement should be created

  Scenario: Announcement created unsuccessfully
    Given I am a registered user logged in
    And I am on the new announcement page
    And I insert invalid announcement informations
    When I click on Crea annuncio button
    Then Announcement should not be created
    
    