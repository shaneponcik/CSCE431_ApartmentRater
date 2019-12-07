And(/^I have an apartment on the site$/) do
  apt = Apartment.create(:name => 'Apt1', :description => 'apartment')
end

And(/^I click on add a review$/) do
  click_link('Add A Review')
end

When(/^I add a review$/) do
  fill_in('title', with: 'Title')
  fill_in('review_text', with: 'Text')
  fill_in('price', with: '1.0')
  click_button('Submit Review')
end

Then(/^I should see the review in previous reviews$/) do
  expect(page).to have_text('Title - review for Apt1')
end

And(/^I click to access an apartment$/) do
  find_by_id('Apt1').click
end

Then(/^I should see a title for the apartment$/) do
  expect(page).to have_text('Apt1')
  expect(page).to have_text('Title')
end

Then(/^I should see the review in the review list$/) do
  expect(page).to have_text('Title - review for Apt1')
  expect(page).to have_text('Made by user1@tamu.edu')
end

Then(/^I should see the title in the review$/) do
  expect(page).to have_text('Apartment: Apt1')
  expect(page).to have_text('Title')
  expect(page).to have_text('User: user1@tamu.edu')
end