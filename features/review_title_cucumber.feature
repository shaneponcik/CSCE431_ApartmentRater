Feature: Add Title to Reviews
  As a Reviewer
  So that I can add a title to a review
  I want to add a title column to the database and include the title in all the forms and views

Background:
  Given I am on the homepage
  And I have an apartment on the site
  When I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  And I click on add a review
  And I add a review

Scenario: Add a review with a title and can see in the previous reviews
  Then I should see the review in previous reviews

Scenario: Add a review with a title and can see the title in the apartment view
  Given I am on the homepage
  When I click to access an apartment
  Then I should see a title for the apartment

Scenario: Add a review with a title and can the review in the admin portal
  When I access the admin portal
  And I access the list of reviews
  Then I should see the review in the review list
  When I click to show
  Then I should see the title in the review