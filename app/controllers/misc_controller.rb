class MiscController < ApplicationController
  def index
    rev1 = Review.first
    puts rev1.get_user
    puts rev1.get_amenities
    puts rev1.get_metrics
    puts rev1.get_tags
    puts rev1.get_apartment
  end
end
