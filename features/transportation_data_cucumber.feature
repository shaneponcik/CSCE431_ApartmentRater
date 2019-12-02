Feature: Add Transportation Data to the Apartment Model
  As a Searcher
  So that I can get information about buses and location compared to campus
  I want to add the extra fields to the database and add them to apartment form

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  When I access the admin portal and click on View Apartments
  Then I am on the page to add a new apartment

Scenario: I can see the transportation data for an apartment
  Given There is an apartment on the site
  When I leave the admin portal
  And I click to see an individual apartment
  Then I should see the transportation data
  
Scenario: Adding an apartment with all values
  When I fill out the apartment form with all values
  And I submit the apartment form
  Then I should be on the list apartment page
  When I click on show
  Then I should see the transportation data

Scenario: Adding an apartment with only a bus route
  When I fill out the apartment form with a bus route
  And I submit the apartment form
  Then I should be on the list apartment page
  When I click on show
  Then I should only see bus route data

Scenario: Adding an apartment with only a building
  When I fill out the form with only a building
  And I submit the apartment form
  Then I should be on the list apartment page
  When I click on show
  Then I should only see building data

Scenario: Adding an apartment with inappropriate input
  When I fill out the form without being close to a building
  And I submit the apartment form
  Then I should be on the list apartment page
  When I click on show
  Then I should see no building close to campus