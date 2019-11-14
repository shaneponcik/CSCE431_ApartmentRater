Feature: Add Admin Portal
  As an admin
  So that I can access features specific to the admins of the system
  I want to add a link in the apartments list display

Background:
  Given I am on the homepage
  When I click on admin only
  Then I am on the page to access admin features

Scenario: Logged out
  When I am on the apartment list page
  And I am logged out
  Then I go to admin portal
  Then I get redirected to the root url

Scenario: Logged in as admin
  When I am on the apartment list page
  And I am logged in as an admin
  Then I go to admin portal
  Then I get to the admin portal page

Scenario: Logged in as non-admin user
  When I am on the apartment list page
  And I am logged out
  Then I go to admin portal
  Then I get redirected to the root url