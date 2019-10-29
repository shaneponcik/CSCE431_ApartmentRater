When(/^I click on Add Apartment$/) do
  click_link('Add an Apartment')
end

Then(/^I am on the page to add a new apartment$/) do
  expect(page).to have_text('New Apartment')
  expect(page).to have_text('Name')
end

When(/^I fill out the new apartment form with a name$/) do
  fill_in('apartment_name', with: 'Awesome Apartment')
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
  expect(page).to have_text('0 review(s) available.')
end

When(/^I don't fill out the new apartment form$/) do

end

Then(/^I should see a failure message for apartments$/) do
  expect(page).to have_text('prohibited this apartment from being saved:')
end

And(/^I should see that the name shouldn't be blank$/) do
  expect(page).to have_text('Name can\'t be blank')
end