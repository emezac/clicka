class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.all

    render json: @vehicles
  end

  def search
    @mykeys=%w(id model_name brand_name year mileage price)
    @vehicles = Vehicle.where(nil)
    filtering_params(params).each do |key, value|
      if key == "model_name"
        value = Vehiclemodel.find_by_name(value).id
      end
      if key == "brand_name"
        value = Vehiclebrand.find_by_name(value).id
      end

      @vehicles = @vehicles.public_send("find_by_#{key}", value) if value.present?
    end

    @total_vehicles = []
    @vehicles.each do |v|
      @nvehicles = [v.id,v.vehiclemodel.name,v.vehiclebrand.name,v.year,v.mileage,v.price]
      @total_vehicles  << Hash[@mykeys.zip(@nvehicles)]
    end

    render json: @total_vehicles 
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehiclemodel = Vehiclemodel.find_by_name(params[:model])
    @vehiclebrand = Vehiclebrand.new(name: params[:brand])
    if @vehiclemodel.nil?
      @vehiclemodel = Vehiclemodel.new(name: params[:model],vehiclebrand_id: @vehiclebrand.id)
    end
    @vehicle = Vehicle.new(vehiclemodel_id: @vehiclemodel.id,
               year: params[:year],price: params[:price])

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_params
      params.require(:vehicle).permit(:year, :mileage, :price, :vehiclemodel_id)
    end

    # A list of the param names that can be used for filtering the Vehicle list
    def filtering_params(params)
      params.slice(:model_name, :brand_name,:year,:mileage)
    end
end
