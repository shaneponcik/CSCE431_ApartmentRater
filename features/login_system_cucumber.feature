Feature: Create Login System
  As a general user
  So that a user can access their account and certain features you have to be logged in for
  I want to verify the username and password with information from the database

Background:
  Given I am on the homepage

Scenario: Trying to login with an established user
  Given I have created a new user
  And I am back on the homepage
  When I click on Log In
  Then I should be on the Log In page
  When I fill out the login form and submit it
  Then I should be successful and redirected back to the homepage

Scenario: Trying to login with a user that doesn't exist
  When I click on Log In
  Then I should be on the Log In page
  When I fill out the login form and submit it
  Then I should receive an error and remain on the login page