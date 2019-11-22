When(/^I access the admin portal and click on View Tags$/) do
  visit root_path
  click_button('Admin Portal')
  click_link('View Tags')
end

Then(/^I am on the page to add the new tag$/) do
  expect(page).to have_text('New Tag')
end

When(/^I fill out the new tag form with a name$/) do
  fill_in('tag_name', with: 'Cool Place')
end

Then(/^I should see a success message for the tag$/) do
  expect(page).to have_text('Tag was successfully created.')
end

When(/^I go to the list of the tags$/) do
  click_link('Back')
end

Then(/^I should see the new tag on the list of tags$/) do
  expect(page).to have_text('Listing tags')
  expect(page).to have_text('Cool Place')
end

When(/^I don't fill out the new tag form$/) do

end

Then(/^I should see a failure message for tags$/) do
  expect(page).to have_text('Tag failed to be created.')
end