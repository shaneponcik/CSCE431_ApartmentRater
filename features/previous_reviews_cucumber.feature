Feature: See Previous Reviews Made
  As a reviewer
  So that I can see previous reviews I have personally made
  I want to get reviews associated with an account and display them

  Background: Start from the homepage and create a new account and then login
    When I am on the homepage
    And I click on Sign Up
    And I fill out the form and submit it
    And I go back to the homepage
    And I click on Login
    And I login to the website the new account

  Scenario: Reviews should show when a user has reviews
    Given I am a user that has made reviews
    When I click on Show Previous Reviews Made
    Then I should see the reviews for the current user

  Scenario: Should see a message that says there are no reviews when a user has no reviews
    Given I am a user that has made no reviews
    When I click on Show Previous Reviews Made
    Then I should see a message that says there are no reviews

