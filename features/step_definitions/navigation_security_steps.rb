When(/^I hardcode to go to the user list$/) do
  visit('/users')
end

When(/^I hardcode to go to the review list$/) do
  visit('/review_list')
end

When(/^I hardcode to go to the apartment list$/) do
  visit('/apartment_list')
end

When(/^I hardcode to go to the tag list$/) do
  visit('/tags')
end

When(/^I hardcode to go to the amenity list$/) do
  visit('/amenities')
end

When(/^I hardcode to go to the metric list$/) do
  visit('/metrics')
end

Given(/^I have multiple users on the site$/) do
  user2 = User.create(:email => 'user2@tamu.edu', :password_digest => '12345')
  user3 = User.create(:email => 'user3@tamu.edu', :password_digest => '23456')
end

When(/^I attempt to edit another users account$/) do
  visit('/users/2/edit')
end

When(/^I attempt to edit my own account$/) do
  visit('/users/1/edit')
end

Then(/^I should be allowed to edit my account$/) do
  expect(page).to have_text('Editing user')
end

When(/^I attempt to see another users account$/) do
  visit('/users/2')
end

When(/^I attempt to see my own account$/) do
  visit('/users/1')
end

Then(/^I should be able to see my account$/) do
  expect(page).to have_text('User: user1@tamu.edu')
end

When(/^I attempt to edit another users review$/) do
  visit('/reviews/4/edit')
end

When(/^I attempt to edit my own review$/) do
  visit('/reviews/7/edit')
end

Then(/^I should be allowed to edit my review$/) do
  expect(page).to have_text('Editing Review')
end

When(/^I attempt to edit an apartment$/) do
  visit('/apartments/1/edit')
end

When(/^I attempt to edit a tag$/) do
  visit('/tags/1/edit')
end

When(/^I attempt to edit an amenity$/) do
  visit('/amenities/1/edit')
end

When(/^I attempt to edit a metric$/) do
  visit('/metrics/1/edit')
end

And(/^I make a review$/) do
  user = User.where(:email => 'user1@tamu.edu').first
  apt = Apartment.where(:name => 'Apt1').first
  review = Review.create(:apartment_id => apt.id, :user_id => user.id, :review_text => 'review', :price => 7)
end