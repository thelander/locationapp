class CommentsController < ApplicationController
  before_action :set_market

  def create
    @comment = @market.comments.new comment_params
    @comment.user = current_user
    @comment.save!

    redirect_to @market, notice: "Din kommentar har skickats"
  end

  def destroy
  end

  private
  def set_market
    @market ||= params[:market_id].present? ? Market.find(params[:market_id]) : Market.new
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
