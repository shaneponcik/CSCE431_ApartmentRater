class ReviewAmenity < ApplicationRecord
  validates :review_id, presence: true
  validates :amenity_id, presence: true

end
