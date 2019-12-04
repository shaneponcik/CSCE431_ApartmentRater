And(/^I have an overall metric$/) do
  metric = Metric.create(:name => 'Overall')
end

And(/^I have a review on an apartment$/) do
  user = User.create(:email => 'blank@tamu.edu', :password_digest => '12345')
  apt = Apartment.create(:name => 'Awesome Place', :description => 'Awesome')
  review = Review.create(:apartment_id => apt.id, :user_id => user.id, :review_text => 'Awesome')
  met = ReviewMetric.create(:review_id => review.id, :metric_id => 1, :rating => 5)
end

Then(/^I should see an apartment with a rating$/) do
  expect(page).to have_text('★')
  expect(page).to have_text('(1)')
end

When(/^I click to see an individual apartment$/) do
  click_link('Awesome Place')
end

Then(/^I should see a review with an overall rating$/) do
  expect(page).to have_text('Rating: 5')
end

When(/^I make a review with the overall metric$/) do
  click_link('Add A Review')
  fill_in('review_text', with: 'Testing comment')
  click_button('Submit Review')
end

And(/^I navigate back to the homepage$/) do
  visit root_path
end

And(/^I should see two reviews with an overall rating$/) do
  expect(page).to have_text('Rating: 5')
  expect(page).to have_text('Rating: 1')
end