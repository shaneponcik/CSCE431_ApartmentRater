When(/^I go back$/) do
  click_link('Back')
end

Given(/^I have apartments on the site$/) do
  apt1 = Apartment.create(:name => 'Apt1', :description => 'apt')
end

When(/^I click on add review$/) do
  click_link('Add A Review')
end

Then(/^I am on the page to add a new review$/) do
  expect(page).to have_text('New Review')
end

When(/^I make a new review$/) do
  fill_in(:review_text, with: 'Description')
  fill_in(:price, with: 1)
  click_button('Submit Review')
end

Then(/^I should be on the previous reviews page$/) do
  expect(page).to have_text('Reviews for')
  #expect(page).to have_text('Review was successfully created')
end

Given(/^I have made a review$/) do
  apt = Apartment.create(:name => 'Apt1', :description => 'apartment')
  user = User.where(:email => 'user1@tamu.edu').first
  review = Review.create(:apartment_id => apt.id, :user_id => user.id, :review_text => 'review', :price => 1)
end

And(/^I click to show$/) do
  click_link('Show')
end

Then(/^I should be on the show a review page$/) do
  expect(page).to have_text('Apartment: Apt1')
  expect(page).to have_text('User: user1@tamu.edu')
end

And(/^I click to edit$/) do
  click_link('Edit')
end

Then(/^I should be on the edit a review page$/) do
  expect(page).to have_text('Editing Review')
end

When(/^I go back accepting the pop up$/) do
  page.accept_confirm do
    click_link('Back')
  end
end

Then(/^I should see I am on the sign up page$/) do
  expect(page).to have_text('Create Account')
end

Then(/^I should see I am on the log in page$/) do
  expect(page).to have_text('Login')
end

When(/^I access the apartment$/) do
  visit root_path
  find_by_id('Apt1').click
end

Then(/^I should see I am on the apartment page$/) do
  expect(page).to have_text('Apartment: Apt1')
end

When(/^I click the back button$/) do
  click_button('Back')
end

When(/^I click to access the admin portal$/) do
  click_link('Admin Portal')
end

Then(/^I should be in the admin portal$/) do
  expect(page).to have_text('Admin Logged In is')
end