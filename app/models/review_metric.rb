class ReviewMetric < ApplicationRecord
  validates :review_id, presence: true
  validates :metric_id, presence: true
  validates :rating, presence: true

end
