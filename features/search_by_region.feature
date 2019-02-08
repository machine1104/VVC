Feature: Search by category
  As a generic user
  I want to search by region
  So that I can find specific announcemnt

  Scenario: Lazio
    Given I am on the home page
    When I select a region
    And I click on Cerca button
    Then I should find the announcemnt in that region