Feature: Signup
  As a guest
  I want to create an account
  So that I can use all site's services
  
  Scenario: User successfully register
    Given I am a guest
    And I am on the sign_up page
    And I insert valid informations
    When I click on Registrati button 
    Then I should be registered

  Scenario: User unsuccessfully register
    Given I am a guest
    And I am on the sign_up page
    And I insert invalid informations
    When I click on Registrati button
    Then I shouldn't be registered