Feature: Add Metric Form
  As a Reviewer
  So that I can add a metric that I want to include with a review
  I want to add a form for adding a metric and add that metric to the database

Background:
  Given I am on the homepage
  When I click on Add Metric
  Then I should be on the page to add the new tag

  Scenario: Create a New Metric
    When I fill out the new metric form with a name
    And Submit the form
    Then I should see a success message for the metric
    When I go to the list of the metrics
    Then I should see the new metric on the list of metrics

  Scenario: Fill out the new metric form with a blank name
    When I don't fill out the new metric form
    And Submit the form
    Then I should see a failure message for metrics
    And I should see that the name shouldn't be blank