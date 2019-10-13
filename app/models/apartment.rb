class Apartment < ApplicationRecord
  def review_count
    return Review.where(:apartment_id => self.id).size
  end
end
