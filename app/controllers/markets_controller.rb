class MarketsController < ApplicationController
  before_action :set_market, :set_markets, :set_comments, :set_rating

  def index
  end

  def show
  end

  def new
    authorize @market
  end

  def create
    @market = Market.create market_params

    authorize @market

    if @market.save
      flash[:notice] = t("markets.created")
    else
      flash[:alert] = t("markets.alert")
    end

    redirect_to markets_path
  end

  private
  def set_market
    @market = params[:id].present? ? Market.find(params[:id]) : Market.new unless @market
  end

  def set_markets
    @markets = Market.by_date unless @markets
  end

  def set_comments
    @comments = @market.comments.by_date unless @comments
  end

  def set_rating
    @rating = Rating.find_by market: @market, user: current_user unless @rating
    @rating = Rating.create market: @market, user: current_user, score: 0 unless @rating
  end

  def market_params
    params.require(:market).permit :name, :description, :address
  end
end
