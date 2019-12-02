Feature: Make the site navigable
  As a General User
  So that I can navigate the website without being confused
  I want to design the navigation flow and implement it

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it

Scenario: I cannot access the user list without being an admin
  When I hardcode to go to the user list
  Then I should be redirected to the homepage
  When I have logged out
  And I hardcode to go to the user list
  Then I should be redirected to the homepage

Scenario: I cannot edit a user without being an admin
  Given I have multiple users on the site
  When I attempt to edit another users account
  Then I should be redirected to the homepage
  When I attempt to edit my own account
  Then I should be allowed to edit my account
  When I have logged out
  And I attempt to edit another users account
  Then I should be redirected to the homepage

Scenario: I cannot view a user without being an admin
  Given I have multiple users on the site
  When I attempt to see another users account
  Then I should be redirected to the homepage
  When I attempt to see my own account
  Then I should be able to see my account
  When I am on the homepage
  And I have logged out
  And I attempt to see another users account
  Then I should be redirected to the homepage

Scenario: I cannot access the review list without being an admin
  When I hardcode to go to the review list
  Then I should be redirected to the homepage
  When I have logged out
  And I hardcode to go to the review list
  Then I should be redirected to the homepage

Scenario: I cannot edit a review without being an admin
  Given I have several reviews added by different users
  And I make a review
  When I attempt to edit another users review
  Then I should be redirected to the homepage
  When I attempt to edit my own review
  Then I should be allowed to edit my review
  When I am on the homepage
  And I have logged out
  And I attempt to edit another users review
  Then I should be redirected to the homepage

Scenario: I cannot access the apartment list without being an admin
  When I hardcode to go to the apartment list
  Then I should be redirected to the homepage
  When I have logged out
  And I hardcode to go to the apartment list
  Then I should be redirected to the homepage

Scenario: I cannot edit an apartment without being an admin
  Given I have apartments on the site
  When I attempt to edit an apartment
  Then I should be redirected to the homepage
  When I have logged out
  And I attempt to edit an apartment
  Then I should be redirected to the homepage

Scenario: I cannot access the tag list without being an admin
  When I hardcode to go to the tag list
  Then I should be redirected to the homepage
  When I have logged out
  And I hardcode to go to the tag list
  Then I should be redirected to the homepage

Scenario: I cannot edit a tag without being an admin
  Given I have tags on the site
  When I attempt to edit a tag
  Then I should be redirected to the homepage
  When I have logged out
  And I attempt to edit a tag
  Then I should be redirected to the homepage

Scenario: I cannot access the amenity list without being an admin
  When I hardcode to go to the amenity list
  Then I should be redirected to the homepage
  When I have logged out
  And I hardcode to go to the amenity list
  Then I should be redirected to the homepage

Scenario: I cannot edit an amenity without being an admin
  Given I have amenities on the site
  When I attempt to edit an amenity
  Then I should be redirected to the homepage
  When I have logged out
  And I attempt to edit an amenity
  Then I should be redirected to the homepage

Scenario: I cannot access the metric list without being an admin
  When I hardcode to go to the metric list
  Then I should be redirected to the homepage
  When I have logged out
  And I hardcode to go to the metric list
  Then I should be redirected to the homepage

Scenario: I cannot edit a metric without being an admin
  Given I have metrics on the site
  When I attempt to edit a metric
  Then I should be redirected to the homepage
  When I have logged out
  And I attempt to edit a metric
  Then I should be redirected to the homepage
