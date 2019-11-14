class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  # GET /apartments
  # GET /apartments.json
  def index
    flash[:back] = 'index'
    @apartments = Apartment.all
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    id = params[:id]
    @apartment = Apartment.find_by_id(id)
    @reviews = Review.where(:apartment_id => id)
  end

  # GET /apartments/new
  def new
    redirect_to apartment_list_path, notice: 'All apartments are created at the top of the page'
  end

  # GET /apartments/1/edit
  def edit
    if current_user.nil?
      return redirect_to root_path, notice: 'Need to be logged in to access this page'
    elsif not current_user.is_admin
      return redirect_to root_path, notice: 'Need to be an admin to access this page'
    end
  end

  def apartment_list
    if current_user.nil?
      return redirect_to root_path, notice: 'Need to be logged in to access this page'
    elsif not current_user.is_admin
      return redirect_to root_path, notice: 'Need to be an admin to access this page'
    end

    flash[:back] = 'list'

    @apartments = Apartment.all

    @apartment = Apartment.new
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to apartment_list_url, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to apartment_list_url, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartment_list_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:name, :description, :imageURL, :website, :address)
    end
end
