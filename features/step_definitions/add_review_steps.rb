Given(/^I am logged in$/) do
  click_link('Sign Up')
  fill_in('user_email', with: 'user1@tamu.edu')
  fill_in('user_password', with: '12345')
  click_button('Save')
  visit root_path
  click_link('Log In')
  fill_in('email', with: 'user1@tamu.edu')
  fill_in('password', with: '12345')
  click_button('Login')
end

Given(/^I am not logged in$/)do

end

When(/^I attempt to add a new review$/)do
  visit new_review_path
end

Then(/^I should be redirected to the homepage$/)do
  expect(page).to have_text('Rate My Apartments')
end

Then(/^I should be brought to the new review form$/)do
  expect(page).to have_text('New Review')
end