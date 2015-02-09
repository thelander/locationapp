class MarketsController < ApplicationController
  before_action :set_market, :set_markets, :set_comments

  def index
  end

  def show
    @rating = @market.ratings.new
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
    @market = params[:id].present? ? Market.find(params[:id]) : Market.new unless @market
  end

  def set_markets
    @markets = Market.all unless @markets
  end

  def set_comments
    @comments = @market.comments.by_date unless @comments
  end

  def set_rating
    @rating ||= Rating.find_by(market: @market, user: current_user)
  end

  def market_params
    params.require(:market).permit :name, :description
  end
end
