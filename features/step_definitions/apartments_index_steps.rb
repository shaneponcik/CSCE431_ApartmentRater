When(/^I go to the homepage$/) do
  apt = Apartment.create(:name => "Apt1")
  apt2 = Apartment.create(:name => "Apt2")
  visit root_path
end

Then(/^I should see the search bar for apartments$/)do
  expect(page).to have_css('#selectbox')
end

Then(/^I should see all the apartments$/)do
  expect(page).to have_text("Apt1")
  expect(page).to have_text("Apt2")
end