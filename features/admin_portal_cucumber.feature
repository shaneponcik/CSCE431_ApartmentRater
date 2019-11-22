Feature: Add Adding Forms to Admin Portal
  As a Admin
  So that certain functions are secure and only those with permission can access them
  I want to move the creation forms into the admin portal, instead of them being on the homepage

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  When I access the admin portal

Scenario: Looking at the list of reviews
  Given I have several reviews added by different users
  When I access the list of reviews
  Then I should see a list of reviews associated with the correct user

Scenario: Looking at the list of users
  Given I have several users that are admins and non-admins
  When I access the list of users
  Then I should see a list of user with the correct options

Scenario: Making a user an admin
  Given I have several users that are admins and non-admins
  When I access the list of users
  And I make a user an admin
  Then I should see that user is now an admin and has the correct options