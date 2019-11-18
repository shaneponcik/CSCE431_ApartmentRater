class AmenitiesController < ApplicationController
  before_action :set_amenity, only: [:show, :edit, :update, :destroy]

  # GET /amenities
  # GET /amenities.json
  def index
    if current_user.nil?
      return redirect_to root_path, notice: 'Need to be logged in to access this page'
    elsif not current_user.is_admin
      return redirect_to root_path, notice: 'Need to be an admin to access this page'
    end
    @amenities = Amenity.all

    @amenity = Amenity.new
  end

  # GET /amenities/1
  # GET /amenities/1.json
  def show
    redirect_to amenities_path, notice: 'All amenities can be viewed from the list'
  end

  # GET /amenities/new
  def new
    redirect_to amenities_path, notice: 'All amenities are created at the top of the page'
  end

  # GET /amenities/1/edit
  def edit
    if current_user.nil?
      return redirect_to root_path, notice: 'Need to be logged in to access this page'
    elsif not current_user.is_admin
      return redirect_to root_path, notice: 'Need to be an admin to access this page'
    end
  end

  # POST /amenities
  # POST /amenities.json
  def create
    @amenity = Amenity.new(amenity_params)

    respond_to do |format|
      if @amenity.save
        format.html { redirect_to amenities_url, notice: 'Amenity was successfully created.' }
        format.json { render :show, status: :created, location: @amenity }
      else
        format.html { redirect_to amenities_url, notice: 'Amenity failed to be created.'}
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amenities/1
  # PATCH/PUT /amenities/1.json
  def update
    respond_to do |format|
      if @amenity.update(amenity_params)
        format.html { redirect_to amenities_url, notice: 'Amenity was successfully updated.' }
        format.json { render :show, status: :ok, location: @amenity }
      else
        format.html { render :edit }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amenities/1
  # DELETE /amenities/1.json
  def destroy
    @amenity.destroy
    respond_to do |format|
      format.html { redirect_to amenities_url, notice: 'Amenity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amenity_params
      params.require(:amenity).permit(:name)
    end
end
