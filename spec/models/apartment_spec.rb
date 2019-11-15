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

describe Apartment, "#average_rating" do
  it "returns the average of Overall metric for an apartment" do
    user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
    apt = Apartment.create(:name => "test")
    apt_id = apt.id
    rev1 = Review.create(:apartment_id => apt_id, :user_id=>user.id, :review_text => "Hello1")
    rev2 = Review.create(:apartment_id => apt_id, :user_id=>user.id, :review_text => "Hello2")
    metric1 = Metric.create(:name => "Overall")
    metric2 = Metric.create(:name => "Overall")
    ReviewMetric.create(:metric_id => metric2.id, :review_id => rev1.id, :rating => 3)
    ReviewMetric.create(:metric_id => metric1.id, :review_id => rev2.id, :rating => 5)
    expect(apt.average_rating).to eq 4.to_f


  end
end
