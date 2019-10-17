require "rails_helper"

describe Review, "#get_user" do
  it "gets the creating user for the review" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    rev = Review.create(:user_id => user.id)
    puts user.id
    expect(rev.get_user).to eq user
  end
end

describe Apartment, "#get_apartment" do
  it "gets the apartment the review describes" do
    apt = Apartment.create()
    rev = Review.create(:apartment_id=>apt.id)
    expect(rev.get_apartment).to eq apt
  end
end
