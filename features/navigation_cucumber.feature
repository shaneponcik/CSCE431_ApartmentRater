Feature: Make the site navigable
  As a General User
  So that I can navigate the website without being confused
  I want to design the navigation flow and implement it

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  And I am on the homepage

Scenario: Making a review routes correctly
  Given I have apartments on the site
  When I click on add review
  Then I am on the page to add a new review
  When I make a new review
  Then I should be on the previous reviews page
  When I go back to the homepage
  Then I should be redirected to the homepage

Scenario: Previous reviews routes correctly
  Given I have made a review
  When I click on Show Previous Reviews Made
  Then I should be on the previous reviews page
  When I go back to the homepage
  Then I should be redirected to the homepage

Scenario: Can see a review and go back
  Given I have made a review
  When I click on Show Previous Reviews Made
  And I click to show a review
  Then I should be on the show a review page
  When I go back
  Then I should be on the previous reviews page

Scenario: Can edit a review and go back
  Given I have made a review
  When I click on Show Previous Reviews Made
  And I click to edit a reviews
  Then I should be on the edit a review page
  When I go back
  Then I should be on the previous reviews page

Scenario: Can delete a review and go back to the same page
  Given I have made a review
  When I click on Show Previous Reviews Made
  And I click to delete a review
  Then I should be on the previous reviews page

Scenario: Signup routes correctly

Scenario: Login routes correctly

Scenario: Looking at apartments routes correctly

Scenario: Accessing the admin portal routes correctly

Scenario: Accessing the users in the admin portal routes correctly

Scenario: Edit a user and go back

Scenario: Can delete a user and go back to the same page

Scenario: Accessing the apartments in the admin portal routes correctly

Scenario: Can see a apartment and go back

Scenario: Can edit a apartment and go back

Scenario: Can delete a apartment and go back to the same page

Scenario: Accessing the tags in the admin portal routes correctly

Scenario: Can edit a tag and go back

Scenario: Can delete a tag and go back to the same page

Scenario: Accessing the metrics in the admin portal routes correctly

Scenario: Can edit a metric and go back

Scenario: Can delete a metric and go back to the same page

Scenario: Accessing the amenities in the admin portal routes correctly

Scenario: Can edit a amenity and go back

Scenario: Can delete a amenity and go back to the same page

Scenario: Accessing the reviews in the admin portal routes correctly

Scenario: Can see a review and go back in the admin portal

Scenario: Can edit a review and go back in the admin portal

Scenario: Can delete a review and go back to the same page in the admin portal