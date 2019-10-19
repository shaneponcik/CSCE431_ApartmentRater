When(/^I go to the homepage and login$/) do
  user1 = User.create(:email => "user1@tamu.edu", :password_digest => "12345")
  apt1 = Apartment.create(:name => "Apt1")
  rev1 = Review.create(:user_id => user1.id, :review_text => "Text1", :apartment_id => apt1.id)
  rev2 = Review.create(:user_id => user1.id, :review_text => "Text2", :apartment_id => apt1.id)

  visit root_path
  click_link('Log In')
  fill_in('email', with: 'user1@tamu.edu')
  fill_in('password', with: '12345')
  click_button('Login')
  visit root_path
end

And(/^I click on Show Previous Reviews Made$/) do
  click_link('Show Previous Reviews Made')
end

Then(/^I should see the reviews for the current user$/)do
  expect(page).to have_text("Review for", :minimum => 2)
  expect(page).to have_text("by user1@tamu.edu", :minimum => 2)
end