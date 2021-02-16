class VehiclemodelsController < ApplicationController
  before_action :set_vehiclemodel, only: [:show, :update, :destroy]

  # GET /vehiclemodels
  def index
    @vehiclemodels = Vehiclemodel.all

    render json: @vehiclemodels
  end

  # GET /vehiclemodels/1
  def show
    render json: @vehiclemodel
  end

  # POST /vehiclemodels
  def create
    @vehiclebrand = Vehiclebrand.find_by_name(params[:brand])
    if @vehiclebrand.nil?
      @vehiclebrand = Vehiclebrand.new(params[:brand])
    end
    @vehiclemodel = Vehiclemodel.new(name: params[:name],vehiclebrand_id: @vehiclebrand.id)

    if @vehiclemodel.save
      render json: @vehiclemodel, status: :created, location: @vehiclemodel
    else
      render json: @vehiclemodel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehiclemodels/1
  def update
    if @vehiclemodel.update(vehiclemodel_params)
      render json: @vehiclemodel
    else
      render json: @vehiclemodel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehiclemodels/1
  def destroy
    @vehiclemodel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehiclemodel
      @vehiclemodel = Vehiclemodel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehiclemodel_params
      params.require(:vehiclemodel).permit(:name, :vehiclebrand_id)
    end
end
