class MiscController < ApplicationController
  def index
    #shows all data in db
    @apartments = Apartment.all
    @reviews = Review.all
    @users = User.all
    @tags = Tag.all
    @amenities = Amenity.all
    @metrics = Metric.all
  end
end
