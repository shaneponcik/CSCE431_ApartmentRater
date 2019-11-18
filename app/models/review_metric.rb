class ReviewMetric < ApplicationRecord
  validates :review_id, presence: true
  validates :metric_id, presence: true
  validates :rating, presence: true
  validates :review_id, uniqueness: { scope: :metric_id }
end
