class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @user = User.where(:id => session[:user_id]).first().email
    @review = Review.get_reviews_for_user(session[:user_id])
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find_by_id(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @metrics = Metric.all
    @tags = Tag.all
    @amenities = Amenity.all
    @apartments = Apartment.all

    if current_user
      @current_user = current_user.id
    else
      return redirect_to root_path
    end

  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    #@review = Review.new(review_params)

    @review = Review.new
    @review.apartment_id = params['apartment_id']
    @review.review_text = params['review_text']
    @review.user_id = params['user_id']

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
    redirect_to @review, notice: 'Review was successfully created.'
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    review_id = @review.id
    ReviewAmenity.where(:review_id => review_id).each do |f|
      f.destroy
    end
    ReviewTag.where(:review_id => review_id).each do |f|
      f.destroy
    end
    ReviewAmenity.where(:review_id => review_id).each do |f|
      f.destroy
    end
    #have to destroy all bridge tables first since they have FK on review
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
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
