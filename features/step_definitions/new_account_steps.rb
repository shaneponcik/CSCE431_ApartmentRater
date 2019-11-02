When(/^I fill out the signup form and submit it$/) do
  fill_in('user_email', with: 'user1@tamu.edu')
  fill_in('user_password', with: '12345')
  fill_in('user_vPassword', with: '12345')
  click_button('Create Account')
end

Then(/^I should see the account creation was successful$/) do
  expect(page).to have_text('Logged in as')
end

When(/^I don't fill out the signup form and submit it$/) do
  click_button('Create Account')
end

Then(/^I should see the account creation failed with two blank errors$/) do
  expect(page).to have_text('Please use a Tamu or Blinn email.')
end

When(/^I only fill out the password of the form and submit it$/) do
  fill_in('user_password', with: '12345')
  fill_in('user_vPassword', with: '12345')
  click_button('Create Account')
end

Then(/^I should see the account creation failed with a blank email error$/) do
  expect(page).to have_text('Please use a Tamu or Blinn email')
end

When(/^I only fill out the email of the form and submit it$/) do
  fill_in('user_email', with: 'user1@tamu.edu')
  click_button('Create Account')
end

Then(/^I should see the account creation failed with a blank password error$/) do
  expect(page).to have_text('error prohibited this user from being saved')
  expect(page).to have_text('Password can\'t be blank')
  expect(page).to have_text('New user')
end

