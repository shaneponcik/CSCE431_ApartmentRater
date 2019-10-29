class ReviewAmenity < ApplicationRecord
  validates :review_id, presence: true
  validates :amenity_id, presence: true
  validates :review_id, uniqueness: { scope: :amenity_id }
end
