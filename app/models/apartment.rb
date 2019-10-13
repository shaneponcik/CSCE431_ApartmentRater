class Apartment < ApplicationRecord
  def get_reviews
    reviews = Review.where(:apartment_id => self.id)
    return reviews
  end
end
