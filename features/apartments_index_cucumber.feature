#shane
Feature: Apartments Index
  As an apartment seeker
  I want to create a page that will be the general starting point for all interactions with the website
  So that I can see apartments with reviews


  Scenario: User goes to the page
    When I go to the homepage
    Then I should see the search bar for apartments
    Then I should see all the apartments