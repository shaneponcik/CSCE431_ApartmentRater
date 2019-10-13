class MiscController < ApplicationController
  def index
    rev1 = Review.first
    user = rev1.get_user
    puts user
    puts rev1.get_amenities
    puts rev1.get_metrics
    puts rev1.get_tags
    puts rev1.get_apartment
    usr1 = User.first
    puts usr1.get_reviews

    apt1 = Apartment.first
    puts apt1.get_reviews

  end
end
