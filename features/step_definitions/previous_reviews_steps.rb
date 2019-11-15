When(/^I am on the homepage$/) do
  visit root_path
end

And(/^I click on Sign Up$/) do
  click_link('Sign Up')
end

And(/^I fill out the form and submit it$/) do
  fill_in('user_email', with: 'user1@tamu.edu')
  fill_in('user_password', with: '12345')
  fill_in('user_vPassword', with: '12345')
  first(:button, 'Create Account', minimum: 1).click
end


And(/^I go back to the homepage$/) do
  click_link('Back')
end

When(/^I click on Show Previous Reviews Made$/) do
  click_link('Show Previous Reviews Made')
end

Given(/^I am a user that has made reviews$/) do
  user1 = User.where(:email => 'user1@tamu.edu').first()
  apt1 = Apartment.create(:name => "Apt1")
  rev1 = Review.create(:user_id => user1.id, :review_text => "Text1", :apartment_id => apt1.id, :price => 1000)
  rev2 = Review.create(:user_id => user1.id, :review_text => "Text2", :apartment_id => apt1.id, :price => 1000)
end

Then(/^I should see the reviews for the current user$/) do
  expect(page).to have_text("Review for", :minimum => 2)
  expect(page).not_to have_text("No reviews here... Why don't you go make one below ;)")
end

Given(/^I am a user that has made no reviews$/) do

end

Then(/^I should see a message that says there are no reviews$/) do
  expect(page).to have_text("No reviews here... Why don't you go make one below ;)")
end

When(/^I have logged out$/) do
  click_link('Log Out')
end

Then(/^I should not see the link for the previous reviews$/) do
  expect(page).not_to have_text('Show Previous Reviews Made')
end

And(/^I can click on add review$/) do
  click_link('New Review')
  expect(page).to have_text('New Review')
end

And(/^I attempt to access the previous reviews page$/) do
  visit('/reviews')
end

Then(/^I should see I am still on the homepage$/) do
  expect(page).to have_text('Rate My Apartment')
end