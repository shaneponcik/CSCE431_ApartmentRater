Given(/^I am an admin$/) do
  user = User.where(:email => 'user1@tamu.edu').first
  admin = AdminTable.create(:user_id => user.id)
end

When(/^I access the admin portal and click on View Amenities$/) do
  visit root_path
  click_button('Admin Portal')
  click_button('Amenities')
end

Then(/^I am on the page to add the new amenity$/) do
  expect(page).to have_text('New Amenity')
end

When(/^I fill out the new amenity form with a name$/) do
  fill_in('amenity_name', with: 'Pool')
end

Then(/^I should see a success message for the amenity$/) do
  expect(page).to have_text('Amenity was successfully created.')
end

Then(/^I should see the new amenity$/) do
  expect(page).to have_text('Listing amenities')
  expect(page).to have_text('Pool')
end

When(/^I don't fill out the new amenity form$/) do

end

Then(/^I should see a failure message for amenities$/) do
  expect(page).to have_text('Amenity failed to be created.')
end