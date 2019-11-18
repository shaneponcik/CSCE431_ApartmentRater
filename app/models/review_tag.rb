class ReviewTag < ApplicationRecord
  validates :review_id, presence: true
  validates :tag_id, presence: true
  validates :review_id, uniqueness: { scope: :tag_id }
end
