When(/^I fill out the form with a blinn email and submit it$/) do
  fill_in('user_email', with: 'user1@blinn.edu')
  fill_in('user_password', with: '12345')
  click_button('Save')
end

Then(/^I should see that I successfully created an account$/) do
  expect(page).to have_text('User was successfully created.')
end

When(/^I fill out the form with a tamu email and submit it$/) do
  fill_in('user_email', with: 'user1@tamu.edu')
  fill_in('user_password', with: '12345')
  click_button('Save')
end

When(/^I fill out the form without a tamu or blinn email and submit it$/) do
  fill_in('user_email', with: 'user1@gmail.com')
  fill_in('user_password', with: '12345')
  click_button('Save')
end

Then(/^I should that I failed to create an account$/) do
  expect(page).to have_text('Please use a Tamu or Blinn email.')
end