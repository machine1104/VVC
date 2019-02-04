Feature: Regione
  As an user
  I want to select a region
  So that I can find announcements in it

  Scenario: Regione
    Given I am on the home page
    When I select Lazio from regione
    And I click on Cerca button
    Then I should be on Lazio page