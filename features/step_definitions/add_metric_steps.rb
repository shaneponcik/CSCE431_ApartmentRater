When(/^I click on Add Metric$/) do
  click_link('Add a Metric')
end

Then(/^I should be on the page to add the new tag$/) do
  expect(page).to have_text('New metric')
end

When(/^I fill out the new metric form with a name$/) do
  fill_in('metric_name', with: 'Transportation')
end

Then(/^I should see a success message for the metric$/) do
  expect(page).to have_text('Metric was successfully created.')
end

When(/^I go to the list of the metrics$/) do
  click_link('Back')
end

Then(/^I should see the new metric on the list of metrics$/) do
  expect(page).to have_text('Listing metrics')
  expect(page).to have_text('Transportation')
end

When(/^I don't fill out the new metric form$/) do

end

Then(/^I should see a failure message for metrics$/) do
  expect(page).to have_text('error prohibited this metric from being saved:')
end