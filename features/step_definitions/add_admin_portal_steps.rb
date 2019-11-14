When(/^When I am on the apartment list page and logged out$/) do
  visit root_path
end

Then(/^I attempt to access admin portal$/) do
  click_button('')
end

Then(/^I get redirected to the root url$/) do
  expect(page).to have_text('')
end

When(/^When I am on the apartment list page and logged in as an admin$/) do
  visit root_path
  fill_in('', with: '')
  click_button('')
  expect(page).to have_text('')
end

Then(/^I attempt to access admin portal$/) do
  visit root_path
  fill_in('', with: '')
  click_button('')
  expect(page).to have_text('')
end

Then(/^I get to access the admin portal$/) do
  visit root_path
  fill_in('', with: '')
  click_button('')
  expect(page).to have_text('')
end

When(/^When I am on the apartment list page and logged in as a non-admin user$/) do
  visit root_path
  fill_in('', with: '')
  click_button('')
  expect(page).to have_text('')
end

Then(/^I attempt to access admin portal$/) do
  visit root_path
  fill_in('', with: '')
  click_button('')
  expect(page).to have_text('')
end

Then(/^I get redirected to the root url$/) do
  visit root_path
  fill_in('', with: '')
  click_button('')
  expect(page).to have_text('')
end
