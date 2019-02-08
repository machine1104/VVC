Feature: Delete announcement
  As a registered user
  I want to delete my announcement
  So that it is no longer available on the platform

  Scenario: Delete succesfully
    Given I am a registered user logged in
    And I have an announcement
    And I am on the miei annunci page
    When I click on Elimina link
    Then Announcement should be deleted