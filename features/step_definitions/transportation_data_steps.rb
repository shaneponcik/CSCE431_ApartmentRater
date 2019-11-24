Given(/^There is an apartment on the site$/) do
  apt = Apartment.create(:name => 'Awesome Place', :bus_route => 27, :near_campus => true, :building_near => 'Zach')
end

When(/^I leave the admin portal$/) do
  click_link('Back')
  click_link('Back')
end

Then(/^I should see the transportation data$/) do
  expect(page).to have_text('Awesome Place')
  expect(page).to have_text('Close to campus')
  expect(page).to have_text('Nearby on-campus buildings: Zach')
  expect(page).to have_text('A&M bus routes nearby: 27.0')
end

When(/^I fill out the apartment form with all values$/) do
  fill_in('apartment_name', with: 'Awesome Place')
  fill_in('apartment_bus_route', with: '27')
  fill_in('apartment_building_near', with: 'Zach')
  choose('apartment_near_campus_true')
end

And(/^I submit the apartment form$/) do
  click_button('Save')
end

Then(/^I should be on the list apartment page$/) do
  expect(page).to have_text('Listing Apartments')
end

When(/^I click on show$/) do
  click_link('Show')
end

When(/^I fill out the apartment form with a bus route$/) do
  fill_in('apartment_name', with: 'Awesome Place')
  fill_in('apartment_bus_route', with: '27')
  choose('apartment_near_campus_false')
end

Then(/^I should only see bus route data$/) do
  expect(page).to have_text('Awesome Place')
  expect(page).to have_text('Not close to campus')
  expect(page).to have_text('A&M bus routes nearby: 27.0')
end

When(/^I fill out the form with only a building$/) do
  fill_in('apartment_name', with: 'Awesome Place')
  fill_in('apartment_building_near', with: 'Zach')
  choose('apartment_near_campus_true')
end

Then(/^I should only see building data$/) do
  expect(page).to have_text('Awesome Place')
  expect(page).to have_text('Close to campus')
  expect(page).to have_text('Nearby on-campus buildings: Zach')
  expect(page).to have_text('No buses nearby')
end

When(/^I fill out the form without being close to a building$/) do
  fill_in('apartment_name', with: 'Awesome Place')
  fill_in('apartment_bus_route', with: 'Some of them')
  fill_in('apartment_building_near', with: 'Zach')
  choose('apartment_near_campus_false')
end

Then(/^I should see no building close to campus$/) do
  expect(page).to have_text('Awesome Place')
  expect(page).to have_text('Not close to campus')
  expect(page).not_to have_text('Nearby on-campus buildings: Zach')
  expect(page).to have_text('No buses nearby')
end