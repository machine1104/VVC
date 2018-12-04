Feature: Signup
  As a guest
  I want to create an account
  so that i can use all site's services
  
  Scenario: User successfully register
    Given I am a guest
    And I am on the homepage
    When I register a valid account
    Then I should be on profile page
    #And I should see a welcome message