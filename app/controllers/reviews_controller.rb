class ReviewsController < ApplicationController
  before_action :set_location

  def create
    @review = @location.reviews.new(review_params)
    @review.user = current_user

    authorize @review
    
    if @review.save
      flash[:notice] = t("reviews.sent")
    else
      flash[:alert] = t("reviews.alert")
    end

    redirect_to @location
  end

  def destroy
  end

  private
  def set_location
    @location = Location.find(params[:location_id]) unless @location
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
