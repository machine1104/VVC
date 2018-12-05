Feature: Signup
  As a guest
  I want to create an account
  so that i can use all site's services
  
  Scenario: User successfully register
    Given I am a guest
    And I am on the registration page
    When I click on the registration button
    Then I should be registered