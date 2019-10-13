class User < ApplicationRecord
  def get_reviews
    return Review.where(:user_id => self.id)
  end
end
