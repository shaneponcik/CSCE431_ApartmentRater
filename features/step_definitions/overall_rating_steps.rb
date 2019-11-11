And(/^I have an overall metric$/) do
  metric = Metric.create(:name => 'Overall')
end

And(/^I have a review on an apartment$/) do
  user = User.create(:email => 'blank@tamu.edu', :password_digest => '12345')
  apt = Apartment.create(:name => 'Awesome Place')
  review = Review.create(:apartment_id => apt.id, :user_id => user.id, :review_text => 'Awesome')
  met = ReviewMetric.create(:review_id => review.id, :metric_id => 1, :rating => 5)
end

Then(/^I should see an apartment with a rating$/) do
  # apt = Apartment.where(:name => 'Awesome Place').first
  # puts(apt.name)
  expect(page).to have_text('Average overall rating: 5 from 1 reviews')
end

When(/^I click to see an individual apartment$/) do
  click_link('Awesome Place')
end

Then(/^I should see a review with an overall rating$/) do
  expect(page).to have_text('Overall Rating: 5')
end