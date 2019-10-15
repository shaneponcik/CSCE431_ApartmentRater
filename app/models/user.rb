class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  def get_reviews
    reviews = Review.where(:user_id => self.id)
    return reviews
  end

end
