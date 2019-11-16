require "rails_helper"

describe Apartment, "#review_count" do
  it "returns the number of reviews for an apartment" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "test")
    apt_id = apt.id
    rev1 = Review.create(:apartment_id => apt_id, :user_id=>user.id, :review_text => "Hello1")
    rev2 = Review.create(:apartment_id => apt_id, :user_id=>user.id, :review_text => "Hello2")

    expect(apt.review_count).to eq 2
  end
end

describe Apartment, "#get_reviews" do
  it "returns the reviews for an apartment" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "test")
    apt_id = apt.id
    rev1 = Review.create(:apartment_id => apt_id, :user_id=>user.id, :review_text => "Hello1")
    rev2 = Review.create(:apartment_id => apt_id, :user_id=>user.id, :review_text => "Hello2")

    revs = apt.get_reviews
    expect(revs[0].review_text).to eq "Hello1"
    expect(revs[1].review_text).to eq "Hello2"
  end
end

describe Apartment, "#is_close" do
  it "returns whether or not the property is close to campus" do
    apt = Apartment.create(:name => "test", :near_campus => true)
    expect(apt.is_close).to eq true
  end
end

describe Apartment, "#get_busses" do
  it "returns the bus routes near the apartment" do
    apt = Apartment.create(:name => "test", :bus_route => 420)
    expect(apt.get_busses).to eq 420
  end
end

describe Apartment, "#get_buildings" do
  it "returns the campus buildings near the apartment" do
    apt = Apartment.create(:name => "test", :building_near => "Zachry")
    expect(apt.building_near).to eq "Zachry"
  end
end
