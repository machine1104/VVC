Feature: Add announcement's image
  As a registered user
  I want to add an image to my announcement
  So that I can show what I'm selling

  Scenario: Add image
    Given I am a registered user logged in
    And I am on the new announcement page
    And I insert valid announcement informations
    And I add an image to the announcement
    When I click on Crea annuncio button
    Then Announcement should be created
    And It show the uploaded image