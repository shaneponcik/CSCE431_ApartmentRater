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
  And I click to show
  Then I should be on the show a review page
  When I go back
  Then I should be on the previous reviews page

#Scenario: Can edit a review and go back
#  Given I have made a review
#  When I click on Show Previous Reviews Made
#  And I click to edit
#  Then I should be on the edit a review page
#  When I go back accepting the pop up
#  Then I should be on the previous reviews page

#Scenario: Can delete a review and go back to the same page
#  Given I have made a review
#  When I click on Show Previous Reviews Made
#  And I click to delete a review
#  Then I should be on the previous reviews page

Scenario: Signup routes correctly
  When I have logged out
  And I click on Sign Up
  Then I should see I am on the sign up page
  When I click the back button
  Then I should be redirected to the homepage

Scenario: Login routes correctly
  When I have logged out
  And I click on Log In
  Then I should see I am on the log in page
  When I click the back button
  Then I should be redirected to the homepage

Scenario: Looking at apartments routes correctly
  Given I have apartments on the site
  When I access the apartment
  Then I should see I am on the apartment page
  When I go back to the homepage
  Then I should be redirected to the homepage

Scenario: Accessing the admin portal routes correctly
  When I click to access the admin portal
  Then I should be in the admin portal
  When I go back to the homepage
  Then I should be redirected to the homepage

Scenario: Accessing the users in the admin portal routes correctly
  When I click to access the admin portal
  And I click to view Users
  Then I should see a list of users
  When I go back
  Then I should be in the admin portal

Scenario: Edit a user and go back
  When I click to access the admin portal
  And I click to view Users
  And I click to edit
  Then I am on the page to edit a user
  And I go back
  Then I should see a list of users

#Scenario: Can delete a user and go back to the same page

Scenario: Accessing the apartments in the admin portal routes correctly
  When I access the admin portal and click on View Apartments
  Then I can see a list of apartments
  When I go back
  Then I should be in the admin portal

Scenario: Can see a apartment and go back
  Given I have apartments on the site
  When I access the admin portal and click on View Apartments
  And I click to show
  Then I should see I am on the apartment page
  When I go back
  Then I can see a list of apartments

Scenario: Can edit a apartment and go back
  Given I have apartments on the site
  When I access the admin portal and click on View Apartments
  And I click to edit
  Then I should see I can edit an apartment
  When I go back
  Then I can see a list of apartments

#Scenario: Can delete a apartment and go back to the same page

Scenario: Accessing the tags in the admin portal routes correctly
  When I access the admin portal and click on View Tags
  Then I can see a list of tags
  When I go back
  Then I should be in the admin portal

Scenario: Can edit a tag and go back
  Given I have tags on the site
  When I access the admin portal and click on View Tags
  And I click to edit
  Then I should see I can edit a tag
  When I go back
  Then I can see a list of tags

#Scenario: Can delete a tag and go back to the same page

Scenario: Accessing the metrics in the admin portal routes correctly
  When I access the admin portal and click on View Metrics
  Then I can see a list of metrics
  When I go back
  Then I should be in the admin portal

Scenario: Can edit a metric and go back
  Given I have metrics on the site
  When I access the admin portal and click on View Metrics
  And I click to edit
  Then I should see I can edit a metric
  When I go back
  Then I can see a list of metrics

#Scenario: Can delete a metric and go back to the same page

Scenario: Accessing the amenities in the admin portal routes correctly
  When I access the admin portal and click on View Amenities
  Then I can see a list of amenities
  When I go back
  Then I should be in the admin portal

Scenario: Can edit a amenity and go back
  Given I have amenities on the site
  When I access the admin portal and click on View Amenities
  And I click to edit
  Then I should see I can edit a amenity
  When I go back
  Then I can see a list of amenities

#Scenario: Can delete a amenity and go back to the same page

Scenario: Accessing the reviews in the admin portal routes correctly
  When I access the admin portal
  And I click on View Reviews
  Then I can see a list of reviews
  When I go back
  Then I should be in the admin portal

Scenario: Can see a review and go back in the admin portal
  Given I have made a review
  When I access the admin portal
  And I click on View Reviews
  And I click to show
  Then I should be on the show a review page
  When I go back
  Then I can see a list of reviews

#Scenario: Can edit a review and go back in the admin portal

#Scenario: Can delete a review and go back to the same page in the admin portal