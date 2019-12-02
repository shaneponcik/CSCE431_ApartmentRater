class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @user = User.where(:id => session[:user_id]).first()
    if @user.nil?
      return redirect_to root_path
    end

    flash[:back] = 'index'
    @email = @user.email
    @review = Review.get_reviews_for_user(session[:user_id])
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    if flash[:back] == 'index' || flash[:edit] == 'index'
      flash[:edit] = 'index'
    elsif flash[:back] == 'list' || flash[:edit] == 'list'
      flash[:edit] = 'list'
    end

    @review = Review.find_by_id(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @review.price = 0.0
    @route = "/reviews"
    @method = "POST"

    #should be same below as edit's
    @metrics = Metric.all
    @tags = Tag.all
    @amenities = Amenity.all
    @apartments = Apartment.all

    review_selected_tags = ReviewTag.where(:review_id => params[:id])
    @review_tags = {}
    Tag.all.each do |tag|
      if review_selected_tags.where(:tag_id => tag.id).size() > 0
        @review_tags[tag.id] = true
      else
        @review_tags[tag.id] = false
      end
    end

    review_selected_amenities = ReviewAmenity.where(:review_id => params[:id])
    @review_amenities = {}
    Amenity.all.each do |amenity|
      if review_selected_amenities.where(:amenity_id => amenity.id).size() > 0
        @review_amenities[amenity.id] = true
      else
        @review_amenities[amenity.id] = false
      end
    end

    review_selected_metrics = ReviewMetric.where(:review_id => params[:id])
    @review_metrics = {}
    Metric.all.each do |metric|
      if review_selected_metrics.where(:metric_id => metric.id).size() > 0
        @review_metrics[metric.id] = review_selected_metrics.where(:metric_id => metric.id).first.rating
      else
        @review_metrics[metric.id] = nil
      end
    end

    #only logged in users can create reviews
    if not current_user
      return redirect_to root_path
    end
    #show be same above as edit's
  end

  # GET /reviews/1/edit
  def edit
    if flash[:back] == 'index' || flash[:edit] == 'index'
      flash[:edit] = 'index'
    elsif flash[:back] == 'list' || flash[:edit] == 'list'
      flash[:edit] = 'list'
    end

    @review = Review.find(params[:id])
    @route = "/reviews/" + params[:id]
    @method = "PUT"

    #should be same below as new's
    @metrics = Metric.all
    @tags = Tag.all
    @amenities = Amenity.all
    @apartments = Apartment.all

    review_selected_tags = ReviewTag.where(:review_id => params[:id])
    @review_tags = {}
    Tag.all.each do |tag|
      if review_selected_tags.where(:tag_id => tag.id).size() > 0
        @review_tags[tag.id] = true
      else
        @review_tags[tag.id] = false
      end
    end

    review_selected_amenities = ReviewAmenity.where(:review_id => params[:id])
    @review_amenities = {}
    Amenity.all.each do |amenity|
      if review_selected_amenities.where(:amenity_id => amenity.id).size() > 0
        @review_amenities[amenity.id] = true
      else
        @review_amenities[amenity.id] = false
      end
    end

    review_selected_metrics = ReviewMetric.where(:review_id => params[:id])
    @review_metrics = {}
    Metric.all.each do |metric|
      if review_selected_metrics.where(:metric_id => metric.id).size() > 0
        @review_metrics[metric.id] = review_selected_metrics.where(:metric_id => metric.id).first.rating
      else
        @review_metrics[metric.id] = nil
      end
    end

    #only logged in users can create reviews
    if not (current_user and current_user.id == @review.user_id)
      return redirect_to root_path
    end
    #should be same above as new's
  end

  def review_list
    if current_user.nil?
      return redirect_to root_path, notice: 'Need to be logged in to access this page'
    elsif not current_user.is_admin
      return redirect_to root_path, notice: 'Need to be an admin to access this page'
    end

    flash[:back] = 'list'

    @reviews = Review.all
  end

  # POST /reviews
  # POST /reviews.json
  def create

    @review = Review.new
    @review.apartment_id = params['apartment_id']
    @review.review_text = params['review_text']
    @review.user_id = params['user_id']
    @review.price = params['price']
    @review.title = params['title']

    ActiveRecord::Base.transaction do
      @review.save

      Amenity.all.each do |amenity|
        if params['amenity_' + amenity.id.to_s]
          ReviewAmenity.create(:review_id => @review.id, :amenity_id => amenity.id)
        end
      end

      Tag.all.each do |tag|
        if params['tag_' + tag.id.to_s]
          ReviewTag.create(:review_id => @review.id, :tag_id => tag.id)
        end
      end

      Metric.all.each do |metric|
        if params['metric_' + metric.id.to_s]
          ReviewMetric.create(:review_id => @review.id, :metric_id => metric.id, :rating => params['metric_' + metric.id.to_s])
        end
      end

    end
    redirect_to reviews_path, notice: 'Review was successfully created.'
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update

    @review = Review.find(params[:id])
    @review.apartment_id = params['apartment_id']
    @review.review_text = params['review_text']
    @review.user_id = params['user_id']
    @review.price = params['price']
    @review.title = params['title']

    ActiveRecord::Base.transaction do
      @review.save
      #Delete all the bridge table entries for the review, since some might be added/removed
      ReviewAmenity.where(:review_id => @review.id).each do |entry|
        entry.destroy
      end
      Amenity.all.each do |amenity|
        if params['amenity_' + amenity.id.to_s]
          ReviewAmenity.create(:review_id => @review.id, :amenity_id => amenity.id)
        end
      end

      ReviewTag.where(:review_id => @review.id).each do |entry|
        entry.destroy
      end
      Tag.all.each do |tag|
        if params['tag_' + tag.id.to_s]
          ReviewTag.create(:review_id => @review.id, :tag_id => tag.id)
        end
      end

      ReviewMetric.where(:review_id => @review.id).each do |entry|
        entry.destroy
      end
      Metric.all.each do |metric|
        if params['metric_' + metric.id.to_s]
          ReviewMetric.create(:review_id => @review.id, :metric_id => metric.id, :rating => params['metric_' + metric.id.to_s])
        end
      end

    end
    redirect_to reviews_path, notice: 'Review was successfully edited.'
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    review_id = params[:id]
    @review = Review.find(review_id)

    if current_user and current_user.id == @review.user_id
      ReviewAmenity.where(:review_id => review_id).each do |f|
        f.destroy
      end
      ReviewTag.where(:review_id => review_id).each do |f|
        f.destroy
      end
      ReviewMetric.where(:review_id => review_id).each do |f|
        f.destroy
      end
      #have to destroy all bridge tables first since they have FK on review
      Review.find(review_id).destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      return redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.fetch(:review, {})
    end
end
