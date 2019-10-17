When(/^I go to the homepage$/) do
  apt = Apartment.create(:name => "Apt1")
  apt = Apartment.create(:name => "Apt2")
  visit root_path
end

Then(/^I should see the search bar for apartments$/)do
  expect(page).to have_css('#selectbox')
end

Then(/^I should see all the apartments$/)do
  expect(page).to have_text("review(s) available", :minimum => 2)
end