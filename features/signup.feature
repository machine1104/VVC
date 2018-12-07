Feature: Signup
  As a guest
  I want to create an account
  So that i can use all site's services
  
  Scenario: User successfully register
    Given I am a guest
    And I am on the registrazione page
    And I insert valid informations
    When I click on Crea account button 
    Then I should be registered

  Scenario: User unsuccessfully register
    Given I am a guest
    And I am on the registrazione page
    And I insert invalid informations
    When I click on Crea account button
    Then I shouldn't be registered