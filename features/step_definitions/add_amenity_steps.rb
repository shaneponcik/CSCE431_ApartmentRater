When(/^I click on Add Amenity$/) do
  click_link('Add an Amenity')
end

Then(/^I am on the page to add the new amenity$/) do
  expect(page).to have_text('New amenity')
end

When(/^I fill out the new amenity form with a name$/) do
  fill_in('amenity_name', with: 'Pool')
end

Then(/^I should see a success message for the amenity$/) do
  expect(page).to have_text('Amenity was successfully created.')
end

When(/^I go to the list of amenities$/) do
  click_link('Back')
end

Then(/^I should see the new amenity$/) do
  expect(page).to have_text('Listing amenities')
  expect(page).to have_text('Pool')
end

When(/^I don't fill out the new amenity form$/) do

end

Then(/^I should see a failure message for amenities$/) do
  expect(page).to have_text('error prohibited this amenity from being saved')
end