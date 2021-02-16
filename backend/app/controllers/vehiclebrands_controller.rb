class VehiclebrandsController < ApplicationController
  before_action :set_vehiclebrand, only: [:show, :update, :destroy]

  # GET /vehiclebrands
  def index
    @vehiclebrands = Vehiclebrand.all

    render json: @vehiclebrands
  end

  # GET /vehiclebrands/1
  def show
    render json: @vehiclebrand
  end

  # POST /vehiclebrands
  def create
    @vehiclebrand = Vehiclebrand.new(vehiclebrand_params)

    if @vehiclebrand.save
      render json: @vehiclebrand, status: :created, location: @vehiclebrand
    else
      render json: @vehiclebrand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehiclebrands/1
  def update
    if @vehiclebrand.update(vehiclebrand_params)
      render json: @vehiclebrand
    else
      render json: @vehiclebrand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehiclebrands/1
  def destroy
    @vehiclebrand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehiclebrand
      @vehiclebrand = Vehiclebrand.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehiclebrand_params
      params.require(:vehiclebrand).permit(:name)
    end
end
