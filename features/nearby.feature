Feature: nearby
  As an user
  I want to put my location
  So that I can find announcements near it

  Scenario: Nearby
    Given I am on the home page
    When I write Roma to autocomplete_address
    And I click on Cerca nelle vicinanze button
    Then I should be on nearby page