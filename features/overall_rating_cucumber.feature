Feature: Display overall Apartment Rating
  As an Apartment Searcher
  So that I can get an idea of how good an apartment is without diving into the details of all the reviews
  I want to query all reviews for an apartment and get the overall rating from them to generate the average overall rating for the apartment

Background:
  Given I am on the homepage
  And I have an overall metric
  And I have a review on an apartment

Scenario: Looking at the homepage
  Given I am on the homepage
  Then I should see an apartment with a rating

Scenario: Looking at an individual apartment
  Given I am on the homepage
  When I click to see an individual apartment
  Then I should see a review with an overall rating