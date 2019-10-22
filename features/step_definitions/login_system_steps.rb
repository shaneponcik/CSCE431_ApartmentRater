Given(/^I am on the homepage$/) do
  visit root_path
end

Given(/^I have created a new user$/) do
  click_link('Sign Up')
  fill_in('user_email', with: 'user1@tamu.edu')
  fill_in('user_password', with: '12345')
  click_button('Save')
end

And(/^I am back on the homepage$/) do
  click_link('Back')
end

When(/^I click on Log In$/) do
  click_link('Log In')
end

Then(/^I should be on the Log In page$/) do
  expect(page).to have_text('Login')
end

When(/^I fill out the login form and submit it$/) do
  fill_in('email', with: 'user1@tamu.edu')
  fill_in('password', with: '12345')
  click_button('Login')
end

Then(/^I should be successful and redirected back to the homepage$/) do
  expect(page).to have_text('Rate My Apartments')
  expect(page).to have_text('Logged in as user1@tamu.edu')
end

Then(/^I should receive an error and remain on the login page$/) do
  expect(page).to have_text('Email or password is invalid')
  expect(page).to have_text('Login')
  expect(page).not_to have_text('Rate My Apartments')
end