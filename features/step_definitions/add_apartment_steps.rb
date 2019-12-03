When(/^I access the admin portal and click on View Apartments$/) do
  visit root_path
  click_button('Admin Portal')
  click_button('Apartments')
end

Then(/^I am on the page to add a new apartment$/) do
  expect(page).to have_text('New Apartment')
  expect(page).to have_text('Name')
  expect(page).to have_text('Description')
  expect(page).to have_text('Website')
  expect(page).to have_text('Imageurl')
end

When(/^I fill out the new apartment form with a name$/) do
  fill_in('apartment_name', with: 'Awesome Apartment')
  fill_in('apartment_imageURL', with: '')
  fill_in('apartment_website', with: 'localhost')
  fill_in('apartment_address', with: '1008 Donnington Dr')
  fill_in('apartment_description', with: 'Lorem ipsum in doler est...')
end

And(/^Submit the form$/) do
  click_button('Save')
end

Then(/^I should see a success message$/) do
  expect(page).to have_text('Apartment was successfully created.')
end

And(/^Be on the individual apartment page$/) do
  expect(page).to have_text('Awesome Apartment')
end

Then(/^I should see the new apartment listed there$/) do
  expect(page).to have_text('Awesome Apartment')
  expect(page).to have_text('Lorem ipsum')
end

When(/^I don't fill out the new apartment form$/) do

end

Then(/^I should see a failure message for apartments$/) do
  expect(page).to have_text('Apartment failed to be created.')
end