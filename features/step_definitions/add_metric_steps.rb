When(/^I access the admin portal and click on View Metrics$/) do
  visit root_path
  click_button('Admin Portal')
  click_button('Metrics')
end

Then(/^I am on the page to add the new metric$/) do
  expect(page).to have_text('New Metric')
end

When(/^I fill out the new metric form with a name$/) do
  fill_in('metric_name', with: 'Transportation')
end

Then(/^I should see a success message for the metric$/) do
  expect(page).to have_text('Metric was successfully created.')
end

Then(/^I should see the new metric on the list of metrics$/) do
  expect(page).to have_text('Listing metrics')
  expect(page).to have_text('Transportation')
end

When(/^I don't fill out the new metric form$/) do

end

Then(/^I should see a failure message for metrics$/) do
  expect(page).to have_text('Metric failed to be created.')
end