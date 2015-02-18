class HomeController < ApplicationController
  before_action :set_markets

  def index
  end

  private
  def set_markets
    @markets = Market.by_date unless @markets
  end
end
