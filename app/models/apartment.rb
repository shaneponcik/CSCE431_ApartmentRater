class Apartment < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def is_close
    close = self.near_campus
    return close
  end

  def get_busses
    busses = self.bus_route
    return busses
  end

  def get_buildings
    buildings = self.building_near
    return buildings
  end
  
  def get_reviews
    reviews = Review.where(:apartment_id => self.id)
    return reviews
  end

  def review_count
    return Review.where(:apartment_id => self.id).size
  end

  def average_rating
    avgRating = 0;
    reviewCount = 0;
    reviews = Review.where(:apartment_id => self.id)
    reviews.each do |review|
      review.get_metrics.each do |metric_key, metric_value|
        if metric_key.name == "Overall"
          avgRating += metric_value
          reviewCount += 1
        end
      end
    end
    if reviewCount == 0
      return "Undefined"
    end
    avgRating = avgRating / reviewCount;
    return avgRating
  end

  def get_tags
    hash = {}

    get_reviews.each do |review|
      review.get_tags.each do |tag|
          hash[tag.name] = (hash[tag.name] || 0) + 1
      end
    end
    return hash
  end


  #pricing data
  def get_average_price
    average = Review.where(:apartment_id => self.id).average(:price)
    if average
      return average
    else
      return nil
    end
  end

  def get_min_price
    minimum = Review.where(:apartment_id => self.id).minimum(:price)
    if minimum
      return minimum.round(2)
    else
      return nil
    end
  end

  def get_max_price
    maximum = Review.where(:apartment_id => self.id).maximum(:price)
    if maximum
      return maximum.round(2)
    else
      return nil
    end
  end

end
