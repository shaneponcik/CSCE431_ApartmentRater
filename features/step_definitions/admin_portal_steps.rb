When(/^I access the admin portal$/) do
  visit root_path
  click_link('Admin Portal')
end

Given(/^I have several reviews added by different users$/) do
  apt1 = Apartment.create(:name => 'Apt1')
  apt2 = Apartment.create(:name => 'Apt2')

  #user1 = User.create(:email => 'user1@tamu.edu', :password_digest => '12345')
  user2 = User.create(:email => 'user2@tamu.edu', :password_digest => '23456')
  user3 = User.create(:email => 'user3@tamu.edu', :password_digest => '34567')
  user4 = User.create(:email => 'user4@tamu.edu', :password_digest => '45678')

  review1 = Review.create(:apartment_id => apt1.id, :user_id => user4.id, :review_text => 'review1', :price => 1.0)
  review2 = Review.create(:apartment_id => apt1.id, :user_id => user2.id, :review_text => 'review2', :price => 2.0)
  review3 = Review.create(:apartment_id => apt1.id, :user_id => user3.id, :review_text => 'review3', :price => 3.0)
  review4 = Review.create(:apartment_id => apt2.id, :user_id => user4.id, :review_text => 'review4', :price => 4.0)
  review5 = Review.create(:apartment_id => apt2.id, :user_id => user2.id, :review_text => 'review5', :price => 5.0)
  review6 = Review.create(:apartment_id => apt2.id, :user_id => user3.id, :review_text => 'review6', :price => 6.0)
end

When(/^I access the list of reviews$/) do
  click_link('View Reviews')
end

Then(/^I should see a list of reviews associated with the correct user$/) do
  expect(page).to have_text('Listing Reviews')

  expect(page).to have_text('Review for Apt1', count: 3)
  expect(page).to have_text('Review for Apt2', count: 3)

  expect(page).to have_text('Made by user4@tamu.edu', count: 2)
  expect(page).to have_text('Made by user2@tamu.edu', count: 2)
  expect(page).to have_text('Made by user3@tamu.edu', count: 2)
end