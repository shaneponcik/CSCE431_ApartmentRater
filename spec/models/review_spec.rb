require "rails_helper"

describe Review, "#get_user" do
  it "gets the creating user for the review" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create()
    rev = Review.create(:user_id => user.id, :review_text => "text", :apartment_id => apt.id)
    expect(rev.get_user).to eq user
  end
end

describe Apartment, "#get_apartment" do
  it "gets the apartment the review describes" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "Apt")
    rev = Review.create(:user_id => user.id, :review_text => "text", :apartment_id => apt.id)
    expect(rev.get_apartment).to eq apt
  end
end

describe Apartment, "#get_amenities" do
  it "gets the amenties attached in the review" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "Test")
    rev = Review.create(:user_id => user.id, :review_text => "text", :apartment_id => apt.id)
    amenity1 = Amenity.create(:name => "Pool")
    amenity2 = Amenity.create(:name => "Bus")
    ReviewAmenity.create(:amenity_id => amenity1.id, :review_id => rev.id)
    ReviewAmenity.create(:amenity_id => amenity2.id, :review_id => rev.id)
    expect(rev.get_amenities.size).to eq 2
  end
end

describe Apartment, "#get_metrics" do
  it "gets the metrics attached in the review" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "test")
    rev = Review.create(:user_id => user.id, :review_text => "text", :apartment_id => apt.id)
    metric1 = Metric.create(:name => "Happiness")
    metric2 = Metric.create(:name => "Transportation")
    ReviewMetric.create(:metric_id => metric1.id, :review_id => rev.id, :rating => 3)
    ReviewMetric.create(:metric_id => metric2.id, :review_id => rev.id, :rating => 3)
    expect(rev.get_metrics.size).to eq 2
  end
end

describe Apartment, "#get_tags" do
  it "gets the tags attached in the review" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "apt1")
    rev = Review.create(:user_id => user.id, :review_text => "text", :apartment_id => apt.id)
    tag1 = Tag.create(:name => "hello")
    tag2 = Tag.create(:name => "test")
    ReviewTag.create(:tag_id => tag1.id, :review_id => rev.id)
    ReviewTag.create(:tag_id => tag2.id, :review_id => rev.id)
    expect(rev.get_tags.size).to eq 2
  end
end

describe Review, "#get_reviews_for_user" do
  it "gets the reviews associated with a user" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "12345")
    user2 = User.create(:email => "test1@tamu.edu", :password_digest => "23456")
    apt = Apartment.create(:name => "apt1")
    rev1 = Review.create(:user_id => user.id, :review_text => "text", :apartment_id => apt.id)
    rev2 = Review.create(:user_id => user.id, :review_text => "text1", :apartment_id => apt.id)
    rev3 = Review.create(:user_id => user2.id, :review_text => "text2", :apartment_id => apt.id)
    expect(Review.get_reviews_for_user(user.id).size).to eq 2
  end
end
