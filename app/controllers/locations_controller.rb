class LocationsController < ApplicationController
  before_action :set_location, :set_locations

  def index
  end

  def show
  end

  def new
    authorize @location
  end

  def create
    @location = Location.new(location_params)

    authorize @location

    if @location.save
      flash[:notice] = t("locations.created")
    else
      flash[:alert] = t("locations.alert")
    end

    redirect_to locations_path
  end

  private
  def set_location
    @location = params[:id].present? ? Location.find(params[:id]) : Location.new unless @location
  end

  def set_locations
    @locations = Location.by_date unless @locations
  end

  def location_params
    params.require(:location).permit(:name, :description, :address)
  end
end
