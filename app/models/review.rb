class Review < ApplicationRecord
  validates :review_text, presence: true
  validates :apartment_id, presence: true
  validates :user_id, presence: true

  def get_apartment
    return Apartment.find(id=self.apartment_id)
  end

  def get_user
    return User.find(id=self.user_id)
  end

  def get_amenities
    review_amenities = ReviewAmenity.where(:review_id => self.id)
    amenities = []
    review_amenities.each do |review_amenity|
      amenities.append(Amenity.find(id=review_amenity.amenity_id))
    end
    return amenities
  end

  def get_metrics
    review_metrics = ReviewMetric.where(:review_id => self.id)
    metrics = {}
    review_metrics.each do |review_metric|
      metrics[Metric.find(id=review_metric.metric_id)] = review_metric.rating
    end
    return metrics
  end

  def get_tags
    review_tags = ReviewTag.where(:review_id => self.id)
    tags = []
    review_tags.each do |review_tag|
      tags.append(Tag.find(id=review_tag.tag_id))
    end
    return tags
  end

  def self.get_reviews_for_user(user)
    return where(:user_id => user)
  end

end
