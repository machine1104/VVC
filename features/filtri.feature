Feature: Filtri
  As an user
  I want to select filters
  So that I can find specific announcements

  Scenario: Filtri
    Given I am on the announcements page
    When I select Crescente from prezzo
    When I select Lazio from regione
    When I select Arredamento from categoria
    And I click on Applica filtri button
    Then I should be on filtered page