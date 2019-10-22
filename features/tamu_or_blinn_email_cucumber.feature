Feature: Have to have Tamu or Blinn email to create account
  As a general user
  So that it's guaranteed all users are students
  I want to verify that email entered when creating an account is a tamu or blinn email

Background:
  Given I am on the homepage
  And I click on Sign Up

Scenario: Creating an account with a Blinn email
  When I fill out the form with a blinn email and submit it
  Then I should see that I successfully created an account

Scenario: Creating an account with a Tamu email
  When I fill out the form with a tamu email and submit it
  Then I should see that I successfully created an account

Scenario: Creating an account without a Tamu or Blinn email
  When I fill out the form without a tamu or blinn email and submit it
  Then I should that I failed to create an account