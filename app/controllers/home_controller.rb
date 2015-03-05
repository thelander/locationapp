class HomeController < ApplicationController
  before_action :set_locations

  def index
  end

  private
  def set_locations
    @locations = Location.by_date unless @locations
  end
end
