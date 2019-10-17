require "rails_helper"

describe Apartment, "#review_count" do
  it "returns the number of reviews for an apartment" do
    apt = Apartment.create
    apt_id = apt.id
    rev1 = Review.create(:apartment_id => apt_id)
    rev2 = Review.create(:apartment_id => apt_id)

    expect(apt.review_count).to eq 2
  end
end

describe Apartment, "#get_reviews" do
  it "returns the reviews for an apartment" do
    apt = Apartment.create
    apt_id = apt.id
    rev1 = Review.create(:apartment_id => apt_id, :review_text => "Hello1")
    rev2 = Review.create(:apartment_id => apt_id, :review_text => "Hello2")

    revs = apt.get_reviews
    expect(revs[0].review_text).to eq "Hello1"
    expect(revs[1].review_text).to eq "Hello2"
  end
end


