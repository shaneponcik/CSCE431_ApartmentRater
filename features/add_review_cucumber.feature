Feature: Add Review
  As a user
  I want to be able to create a review
  So that I can give my opinion on an apartment I lived at

  Background:
    Given I am on the homepage

  Scenario: Trying to add a review not logged in
    Given I am not logged in
    When I attempt to add a new review
    Then I should be redirected to the homepage

  Scenario: Trying to add a review logged in
    Given I am logged in
    When I attempt to add a new review
    Then I should be brought to the new review form
