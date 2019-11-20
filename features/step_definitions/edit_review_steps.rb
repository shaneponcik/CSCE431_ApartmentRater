When(/^I attempt to edit any review$/)do
  new_user = User.new
  new_user.email = "user1@tamu.edu"
  new_user.password_digest = "12345"
  new_user.save
  current_user = User.where(:email => 'user1@tamu.edu').first
  new_apt = Apartment.new
  new_apt.name = "random"
  new_apt.save
  new_rev = Review.new
  new_rev.review_text = "123"
  new_rev.price = 1000
  new_rev.user_id = current_user.id
  new_rev.apartment_id = new_apt.id
  new_rev.save
  visit('/reviews/'+new_rev.id.to_s+"/edit")
end

When(/^I attempt to edit a review that is not my own$/)do
  new_user = User.new
  new_user.email = "user2@tamu.edu"
  new_user.password_digest = "12345"
  new_user.save
  current_user = User.where(:email => 'user1@tamu.edu').first
  new_apt = Apartment.new
  new_apt.name = "random"
  new_apt.save
  new_rev = Review.new
  new_rev.review_text = "123"
  new_rev.user_id = new_user.id
  new_rev.apartment_id = new_apt.id
  new_rev.save
  visit('/reviews/'+new_rev.id.to_s+"/edit")
end

When(/^I attempt to edit a review that is my own$/)do
  current_user = User.where(:email => 'user1@tamu.edu').first
  new_apt = Apartment.new
  new_apt.name = "random"
  new_apt.save
  new_rev = Review.new
  new_rev.review_text = "123"
  new_rev.user_id = current_user.id
  new_rev.apartment_id = new_apt.id
  new_rev.save
  visit('/reviews/'+new_rev.id.to_s+"/edit")
end

Then(/^I should be brought to the edit form$/)do
  expect(page).to have_text('Editing Review')
end