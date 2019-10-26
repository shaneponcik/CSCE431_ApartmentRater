Feature: Create a new account
  As a general user
  So that I can create an account
  I want to have the user enter data for their account and add that data to the database

Background:
  Given I am on the homepage
  And I click on Sign Up

Scenario: Make a new account
  When I fill out the signup form and submit it
  Then I should see the account creation was successful

Scenario: Attempt to create a new account but with blank fields
  When I don't fill out the signup form and submit it
  Then I should see the account creation failed with two blank errors

Scenario: Attempt to create an account with only a password
  When I only fill out the password of the form and submit it
  Then I should see the account creation failed with a blank email error

Scenario: Attempt to create an account with only an email
  When I only fill out the email of the form and submit it
  Then I should see the account creation failed with a blank password error