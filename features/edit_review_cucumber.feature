#shane
Feature: Edit Review
  As a user
  I want to be able to edit my own reviews
  So that I can change any details if necessary

  Background:
    Given I am on the homepage

  Scenario: Trying to edit any review not logged in
    Given I am not logged in
    When I attempt to edit any review
    Then I should be redirected to the homepage

  Scenario: Trying to edit any review that is not my own
    Given I am logged in
    When I attempt to edit a review that is not my own
    Then I should be redirected to the homepage

  Scenario: Trying to edit my own review
    Given I am logged in
    When I attempt to edit a review that is my own
    Then I should be brought to the edit form