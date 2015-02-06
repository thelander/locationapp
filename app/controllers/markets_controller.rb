class MarketsController < ApplicationController
  before_action :set_market, :set_markets, :set_comments

  def index
  end

  def show
  end

  def new
  end

  def create
    @market = Market.create market_params

    if @market.save
      redirect_to markets_path, notice: "Ny marknad skapad"
    else
      redirect_to markets_path, alert: "Skapa ny marknad misslyckades"
    end
  end

  private
  def set_market
    @market ||= params[:id].present? ? Market.find(params[:id]) : Market.new
  end

  def set_markets
    @markets ||= Market.all
  end

  def set_comments
    @comments ||= @market.comments.by_date
  end

  def market_params
    params.require(:market).permit :name, :description
  end
end
