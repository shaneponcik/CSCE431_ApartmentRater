class ReviewTag < ApplicationRecord
  validates :review_id, presence: true
  validates :tag_id, presence: true

end
