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

describe Apartment, "#get_amenities" do
  it "gets the amenties attached in the review" do
    apt = Apartment.create()
    rev = Review.create(:apartment_id=>apt.id)
    amenity1 = Amenity.create()
    amenity2 = Amenity.create()
    ReviewAmenity.create(:amenity_id => amenity1.id, :review_id => rev.id)
    ReviewAmenity.create(:amenity_id => amenity2.id, :review_id => rev.id)
    expect(rev.get_amenities.size).to eq 2
  end
end

describe Apartment, "#get_metrics" do
  it "gets the metrics attached in the review" do
    apt = Apartment.create()
    rev = Review.create(:apartment_id=>apt.id)
    metric1 = Metric.create()
    metric2 = Metric.create()
    ReviewMetric.create(:metric_id => metric1.id, :review_id => rev.id, :rating => 3)
    ReviewMetric.create(:metric_id => metric2.id, :review_id => rev.id, :rating => 3)
    expect(rev.get_metrics.size).to eq 2
  end
end

describe Apartment, "#get_tags" do
  it "gets the tags attached in the review" do
    apt = Apartment.create()
    rev = Review.create(:apartment_id=>apt.id)
    tag1 = Tag.create()
    tag2 = Tag.create()
    ReviewTag.create(:tag_id => tag1.id, :review_id => rev.id)
    ReviewTag.create(:tag_id => tag2.id, :review_id => rev.id)
    expect(rev.get_tags.size).to eq 2
  end
end
