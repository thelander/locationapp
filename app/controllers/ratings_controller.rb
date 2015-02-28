class RatingsController < ApplicationController
  before_action :set_market, :set_rating

  def update
    authorize @rating

    if @rating.update(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def set_market
    @market = params[:market_id].present? ? Market.find(params[:market_id]) : Market.new unless @market
  end

  def set_rating
    @rating = Rating.find_or_create_by(market: @market, user: current_user) unless @rating
  end
end
