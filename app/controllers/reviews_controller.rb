class ReviewsController < ApplicationController
  before_action :set_market

  def create
    @review = @market.reviews.new(review_params)
    @review.user = current_user

    authorize @review
    
    if @review.save
      flash[:notice] = t("reviews.sent")
    else
      flash[:alert] = t("reviews.alert")
    end

    redirect_to @market
  end

  def destroy
  end

  private
  def set_market
    @market = Market.find(params[:market_id]) unless @market
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
