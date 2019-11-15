Feature: Add Amenities Form
  As a Reviewer
  So that I can add an amenity that I want to include with a review
  I want to add a form for adding an amenity and add that metric to the database

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  When I access the admin portal and click on View Amenities
  Then I am on the page to add the new amenity

Scenario: Create a New Amenity
  When I fill out the new amenity form with a name
  And Submit the form
  Then I should see a success message for the amenity
  And I should see the new amenity

Scenario: Fill out the new amenity form with a blank name
  When I don't fill out the new amenity form
  And Submit the form
  Then I should see a failure message for amenities